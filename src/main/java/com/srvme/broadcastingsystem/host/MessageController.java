package com.srvme.broadcastingsystem.host;

import com.srvme.broadcastingsystem.service.MyWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MessageController {

    @Autowired
    private MyWebSocketHandler webSocketHandler;

    @GetMapping("/send")
    public String sendMessage(@RequestParam String message) {
        webSocketHandler.sendMessageToAll(message);
        return "Message sent!";
    }
}
