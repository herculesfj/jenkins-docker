package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class TemperatureConverterTest {
    @Test
    public void testFahrenheitToCelsius() {
        assertEquals(0.0, TemperatureConverter.fahrenheitToCelsius(32), 0.001);
        assertEquals(100.0, TemperatureConverter.fahrenheitToCelsius(212), 0.001);
    }

    @Test
    public void testCelsiusToFahrenheit() {
        assertEquals(32.0, TemperatureConverter.celsiusToFahrenheit(0), 0.001);
        assertEquals(212.0, TemperatureConverter.celsiusToFahrenheit(100), 0.001);
    }
} 