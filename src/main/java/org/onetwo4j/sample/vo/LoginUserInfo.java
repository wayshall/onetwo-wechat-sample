package org.onetwo4j.sample.vo;

import lombok.Builder;
import lombok.Value;

/**
 * @author wayshall
 * <br/>
 */
@Value
@Builder
public class LoginUserInfo {
	
	String id;
	String nickname;
	String headimgurl;

}
