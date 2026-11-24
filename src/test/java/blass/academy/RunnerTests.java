package blass.academy;

import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class RunnerTests {
    @Test
    void runnerTest() {
        final var result = Runner.path("classpath:blass/academy")
                .tags("~@ignore")
                .outputHtmlReport(true)
                .parallel(10);
        assertTrue(result.isPassed());
    }
}