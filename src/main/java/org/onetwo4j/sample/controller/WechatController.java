package org.onetwo4j.sample.controller;

import org.onetwo.common.data.DataResult;
import org.onetwo.ext.apiclient.wechat.utils.OAuth2UserInfo;
import org.onetwo4j.sample.utils.WebConstants;
import org.onetwo4j.sample.vo.LoginUserInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wayshall
 * <br/>
 */
@RestController
@RequestMapping(WebConstants.BASE_PATH+"/wechat")
public class WechatController extends BaseController {

	@RequestMapping("/currentUser")
	public DataResult<?> currentUser(OAuth2UserInfo userInfo) {
		LoginUserInfo loginUser = LoginUserInfo.builder().build();
        return result().data(loginUser)
        				.buildResult();
    }

	@RequestMapping(value="/bind", method=RequestMethod.POST)
	public String createBind() {
        return redirect("/order/new");
    }

}
