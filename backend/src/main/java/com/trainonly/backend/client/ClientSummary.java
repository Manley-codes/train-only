package com.trainonly.backend.client;

public record ClientSummary(
        long clientId,
        String firstName,
        String lastName,
        String email,
        String phone
) {
}
