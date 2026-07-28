package com.trainonly.backend.client;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public List<ClientSummary> listClientsForTrainer(long trainerId) {
        if (trainerId <= 0) {
            throw new IllegalArgumentException("trainerId must be positive");
        }

        return clientRepository.findByTrainerId(trainerId);
    }
}
