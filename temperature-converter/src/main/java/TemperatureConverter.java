package com.example;

public class TemperatureConverter {
    public static double fahrenheitToCelsius(double f) {
        return (f - 32) * 5 / 9;
    }

    public static double celsiusToFahrenheit(double c) {
        return (c * 9 / 5) + 32;
    }
    
    // Método main para demonstração
    public static void main(String[] args) {
        System.out.println("Teste");
    }
} 