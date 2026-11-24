package blass.academy.productos;

import io.karatelabs.core.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class ProductosRunner {
    @Test
    void productosTest() {
        final var result = Runner.path("classpath:blass/academy/productos")
                .tags("@productos")
                .outputHtmlReport(true)
                .parallel(1);
        assertTrue(result.isPassed());
    }
}
