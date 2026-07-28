package com.trainonly.backend.client;

import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import com.trainonly.backend.error.GlobalExceptionHandler;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.json.JsonCompareMode;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class ClientControllerTest {

    private ClientService clientService;
    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        clientService = mock(ClientService.class);
        mockMvc = MockMvcBuilders
                .standaloneSetup(new ClientController(clientService))
                .setControllerAdvice(new GlobalExceptionHandler())
                .build();
    }

    @Test
    void getClientsBindsTrainerIdAndReturnsExpectedClientSummaries() throws Exception {
        given(clientService.listClientsForTrainer(1)).willReturn(List.of(
                new ClientSummary(1, "Marcus", "Johnson", "marcus@example.com", "832-555-0101"),
                new ClientSummary(2, "Alicia", "Taylor", "alicia.taylor@example.com", "713-555-0125")
        ));

        mockMvc.perform(get("/api/trainers/1/clients"))
                .andExpect(status().isOk())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(content().json("""
                        [
                          {
                            "clientId": 1,
                            "firstName": "Marcus",
                            "lastName": "Johnson",
                            "email": "marcus@example.com",
                            "phone": "832-555-0101"
                          },
                          {
                            "clientId": 2,
                            "firstName": "Alicia",
                            "lastName": "Taylor",
                            "email": "alicia.taylor@example.com",
                            "phone": "713-555-0125"
                          }
                        ]
                        """, JsonCompareMode.STRICT));

        verify(clientService).listClientsForTrainer(1);
    }

    @Test
    void invalidTrainerIdReturnsBadRequest() throws Exception {
        given(clientService.listClientsForTrainer(0))
                .willThrow(new IllegalArgumentException("trainerId must be positive"));

        mockMvc.perform(get("/api/trainers/0/clients"))
                .andExpect(status().isBadRequest())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(content().json("""
                        {"message":"trainerId must be positive"}
                        """, JsonCompareMode.STRICT));
    }

    @Test
    void dataAccessFailureReturnsOnlyGenericSafeMessage() throws Exception {
        given(clientService.listClientsForTrainer(1))
                .willThrow(new ClientDataAccessException(
                        "Sensitive internal database details",
                        new IllegalStateException("Sensitive root cause")
                ));

        mockMvc.perform(get("/api/trainers/1/clients"))
                .andExpect(status().isInternalServerError())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(content().json("""
                        {"message":"The client list could not be loaded."}
                        """, JsonCompareMode.STRICT));
    }
}
