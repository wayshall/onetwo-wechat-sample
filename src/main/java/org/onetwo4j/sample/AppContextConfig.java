package org.onetwo4j.sample;

import org.onetwo.boot.module.security.url.EnableUrlSecurity;
import org.onetwo.plugins.admin.utils.WebAdminPermissionConfig.RootMenuClassProvider;
import org.onetwo4j.sample.utils.Apps;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableUrlSecurity
public class AppContextConfig  {

	@Bean
	public RootMenuClassProvider menuConfig(){
		return ()->Apps.class;
	}

}
