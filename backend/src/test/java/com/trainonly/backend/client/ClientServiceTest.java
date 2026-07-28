package com.trainonly.backend.client;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatIllegalArgumentException;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

class ClientServiceTest {

    private final ClientRepository clientRepository = mock(ClientRepository.class);
    private final ClientService clientService = new ClientService(clientRepository);

    @ParameterizedTest
    @ValueSource(longs = {0, -1})
    void rejectsNonPositiveTrainerIds(long trainerId) {
        assertThatIllegalArgumentException()
                .isThrownBy(() -> clientService.listClientsForTrainer(trainerId))
                .withMessage("trainerId must be positive");

        verifyNoInteractions(clientRepository);
    }

    @Test
    void delegatesValidTrainerIdToRepository() {
        List<ClientSummary> expectedClients = List.of(
                new ClientSummary(1, "Marcus", "Johnson", "marcus@example.com", "832-555-0101")
        );
        given(clientRepository.findByTrainerId(1)).willReturn(expectedClients);

        List<ClientSummary> actualClients = clientService.listClientsForTrainer(1);

        assertThat(actualClients).isSameAs(expectedClients);
        verify(clientRepository).findByTrainerId(1);
    }
}
