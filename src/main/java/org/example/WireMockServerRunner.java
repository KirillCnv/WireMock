package org.example;

import com.github.tomakehurst.wiremock.WireMockServer;
import static com.github.tomakehurst.wiremock.client.WireMock.*;

public class WireMockServerRunner {

    public static void main(String[] args) {
        WireMockServer wireMockServer = new WireMockServer(8080);
        wireMockServer.start();
        System.out.println("WireMock Server started on port 8080");

        wireMockServer.stubFor(get(urlEqualTo("/api/data"))
                .willReturn(aResponse()
                        .withStatus(200)
                        .withHeader("Content-Type", "application/json")
                        .withBody("{\"message\":\"Hello from WireMock!\"}")));
    }
}