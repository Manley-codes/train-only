package com.trainonly.backend.error;

import com.trainonly.backend.client.ClientDataAccessException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger LOGGER =
            LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<ApiError> handleBadRequest(IllegalArgumentException exception) {
        return ResponseEntity
                .badRequest()
                .body(new ApiError(exception.getMessage()));
    }

    @ExceptionHandler(ClientDataAccessException.class)
    public ResponseEntity<ApiError> handleDataAccess(ClientDataAccessException exception) {
        LOGGER.error("Unable to load the client list", exception);

        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ApiError("The client list could not be loaded."));
    }
}