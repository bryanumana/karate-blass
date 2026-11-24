package blass.academy.auth;

import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class AuthRunner {
    @Test
    void authTest() {
        final var result = Runner.path("classpath:blass/academy/auth")
                .tags("@auth")
                .outputHtmlReport(true)
                .parallel(1);
        assertTrue(result.isPassed());
    }
}
