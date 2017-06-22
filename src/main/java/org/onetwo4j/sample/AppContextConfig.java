package org.onetwo4j.sample;

import javax.annotation.PostConstruct;

import org.onetwo.boot.module.security.config.EnableCommonSecurity;
import org.onetwo.ext.apiclient.wechat.serve.dto.ReceiveMessage.TextMessage;
import org.onetwo.ext.apiclient.wechat.serve.dto.ReplyMessage.TextReplyMessage;
import org.onetwo.ext.apiclient.wechat.serve.spi.MessageRouterService;
import org.onetwo4j.sample.utils.DefaultWebSecurityConfigurerAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@EnableCommonSecurity
public class AppContextConfig {
	
	@Autowired
	MessageRouterService messageRouterService;
	
	public AppContextConfig(){
	}
	
	@PostConstruct
	public void init(){
		this.messageRouterService.register((TextMessage text)->{
			System.out.println("message: " + text);
			return TextReplyMessage.builder()
									.fromUserName(text.getToUserName())
									.toUserName(text.getFromUserName())
									.content("test")
									.build();
		});
	}

	@Bean
	public DefaultWebSecurityConfigurerAdapter simpleWebSecurityConfigurerAdapter(){
		return new DefaultWebSecurityConfigurerAdapter();
	}
	
}
