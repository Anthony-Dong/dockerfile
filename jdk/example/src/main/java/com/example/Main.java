package com.example;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Main {
    public static void main(String[] args) {
        log.info("Main");
        log.info("java-home: {}", System.getProperty("java.home"));
    }
}
