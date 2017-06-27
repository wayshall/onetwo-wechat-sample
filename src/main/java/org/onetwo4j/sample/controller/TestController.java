package org.onetwo4j.sample.controller;

import javax.servlet.http.HttpServletRequest;

import org.onetwo.boot.core.web.controller.AbstractBaseController;
import org.onetwo.boot.core.web.mvc.annotation.Interceptor;
import org.onetwo.boot.module.wechat.WechatOAuth2MvcInterceptor;
import org.onetwo.ext.apiclient.wechat.serve.spi.WechatUserStoreService;
import org.onetwo.ext.apiclient.wechat.utils.OAuth2UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wayshall
 * <br/>
 */
@RestController
@Interceptor(WechatOAuth2MvcInterceptor.class)
public class TestController extends AbstractBaseController{

	@Autowired
	private WechatUserStoreService sessionStoreService;
	
	@GetMapping("/test")
	public Object test(HttpServletRequest request){
		OAuth2UserInfo userInfo = sessionStoreService.getCurrentUser(request).get();
		return userInfo;
	}

}
