package com.trainonly.backend.client;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

@Repository
public class ClientRepository {

    private final JdbcClient jdbcClient;

    public ClientRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public List<ClientSummary> findByTrainerId(long trainerId) {
        String sql = """
                SELECT
                    client_id,
                    first_name,
                    last_name,
                    email,
                    phone
                FROM clients
                WHERE trainer_id = ?
                ORDER BY last_name, first_name, client_id
                """;

        try {
            return jdbcClient.sql(sql)
                    .param(trainerId)
                    .query((resultSet, rowNumber) -> new ClientSummary(
                            resultSet.getLong("client_id"),
                            resultSet.getString("first_name"),
                            resultSet.getString("last_name"),
                            resultSet.getString("email"),
                            resultSet.getString("phone")
                    ))
                    .list();
        } catch (DataAccessException exception) {
            throw new ClientDataAccessException("Unable to load clients for trainer " + trainerId, exception);
        }
    }
}
