package br.senac.sp.appleacademyapi.config;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class HealthProbeController {

    @GetMapping("/ping")
    ResponseEntity<String> ping() {
        return ResponseEntity.ok("pong");
    }
}
