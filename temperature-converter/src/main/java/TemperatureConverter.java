package com.example;

public class TemperatureConverter {
    public static double fahrenheitToCelsius(double f) {
        return (f - 32) * 5 / 9;
    }

    public static double celsiusToFahrenheit(double c) {
        return (c * 9 / 5) + 32;
    }
    
    // Erro de sintaxe para demonstrar falha no build
    public static void main(String[] args) {
        System.out.println("Teste");
        // Erro de sintaxe intencional
        if (true {
            System.out.println("Erro de sintaxe");
        }
    }
} 