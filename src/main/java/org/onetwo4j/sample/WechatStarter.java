package org.onetwo4j.sample;

import org.onetwo.ext.apiclient.wechat.EnableWechatClient;
import org.onetwo.ext.apiclient.wechat.serve.EnableWechatServe;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication
@EnableWechatClient
@EnableWechatServe
public class WechatStarter {
	
	@RequestMapping("/")
	public String home() {
        return "index";
    }

    public static void main(String[] args) {
        new SpringApplicationBuilder(WechatStarter.class)
        							.web(true)
        							.build()
        							.run(args);
    }
}
