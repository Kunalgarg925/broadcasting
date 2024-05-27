package com.srvme.broadcastingsystem.config;

import com.srvme.broadcastingsystem.service.MyWebSocketHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        System.out.println("websocket create karne ke liye to aaya");
        registry.addHandler(new MyWebSocketHandler(), "/ws")
                .setAllowedOrigins("*"); // Allow all origins;
    }
}
