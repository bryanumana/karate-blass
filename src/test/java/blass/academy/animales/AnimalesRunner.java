package blass.academy.animales;

import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class AnimalesRunner {
    @Test
    void animalesTest() {
        final var result = Runner.path("classpath:blass/academy/animales")
                .tags("@animales", "~@ignore")
                .outputHtmlReport(true)
                .parallel(1);
        assertTrue(result.isPassed());
    }
}
