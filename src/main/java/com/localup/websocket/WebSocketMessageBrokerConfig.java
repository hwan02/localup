package com.localup.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketMessageBrokerConfig extends AbstractWebSocketMessageBrokerConfigurer{

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		//해당 프로젝트에 스프링 시큐리티를 적용했다면 시큐리티에서 /stomp/** 경로는 통신을 허용하도록 해줘야 크로스도메인 관련 에러메시지가 발생하지 않는다. 웹소켓과 관련하여 스프링 시큐리티 설정이 따로 있으니 자세한 내용은 찾아보도록 하자.
		registry.addEndpoint("/stomp")
		.setAllowedOrigins("http://localhost")
		.withSockJS()
		.setStreamBytesLimit(512*1024)
		.setHttpMessageCacheSize(1000)
		.setDisconnectDelay(30*1000);
	}
	@Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app");
        registry.enableSimpleBroker("/subscribe", "/topic");
    }
}
