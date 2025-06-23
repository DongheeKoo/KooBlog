package com.kooblog

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class KooBlogApplication

fun main(args: Array<String>) {
    runApplication<KooBlogApplication>(*args)
} 