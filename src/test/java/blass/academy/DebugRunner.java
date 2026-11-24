package blass.academy;

import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class DebugRunner {
    @Test
    void debugTest() {
        final var result = Runner.path("classpath:blass/academy")
                .tags("@debug")
                .outputHtmlReport(true)
                .parallel(1);
        assertTrue(result.isPassed());
    }
}