package org.onetwo4j.sample;

import javax.annotation.PostConstruct;

import org.onetwo.boot.core.EnableJFishBootExtension;
import org.onetwo.boot.core.EnableJFishBootExtension.AppcationType;
import org.onetwo.dbm.spring.EnableDbm;
import org.onetwo.ext.apiclient.wechat.EnableWechatClient;
import org.onetwo.ext.apiclient.wechat.serve.dto.ReceiveMessage.TextMessage;
import org.onetwo.ext.apiclient.wechat.serve.dto.ReplyMessage.TextReplyMessage;
import org.onetwo.ext.apiclient.wechat.serve.spi.MessageRouterService;
import org.onetwo.ext.apiclient.wechat.utils.WechatConstants.MessageType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication
@EnableWechatClient
@EnableDbm
@EnableJFishBootExtension(appcationType=AppcationType.WEB_UI)
public class WechatStarter {
	
	@Autowired
	MessageRouterService messageRouterService;
	
	@PostConstruct
	public void init(){
		this.messageRouterService.register(MessageType.TEXT, (TextMessage text)->{
			return TextReplyMessage.builder()
									.fromUserName(text.getToUserName())
									.toUserName(text.getFromUserName())
									.content("我收到你的消息啦~")
									.build();
		});
	}
	
	@RequestMapping("/")
	public String home(/*OAuth2UserInfo userInfo*/) {
        return "forward:index.html";
    }
	

    public static void main(String[] args) {
        new SpringApplicationBuilder(WechatStarter.class)
        							.web(true)
        							.build()
        							.run(args);
    }
}
