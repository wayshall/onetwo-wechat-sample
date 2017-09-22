package org.onetwo4j.sample.controller;

import org.onetwo4j.sample.utils.WebConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author wayshall
 * <br/>
 */
@Controller
@RequestMapping(WebConstants.BASE_PATH+"/order")
public class OrderController extends BaseController {

	@RequestMapping("/new")
	public String newOrder(boolean wechatBinded) {
		if(wechatBinded){
			return "order-form";
		}
        return redirect("/wechat/bind");
    }

	@RequestMapping(value="", method=RequestMethod.POST)
	public String create() {
        return redirect("/order/1/payment");
    }

	@RequestMapping(value="/{orderId}/payment", method=RequestMethod.GET)
	public String payment(Long orderId, boolean test) {
		if(test){
			return "order-payment-result";
		}
        return "order-payment";
    }

	@RequestMapping(value="/{orderId}/payment", method=RequestMethod.POST)
	public String doPayment(Long orderId) {
        return "order-payment-result";
    }
}
