package org.onetwo4j.sample.utils;

import org.onetwo.plugins.admin.AdminModule;


public interface Apps {
	String name = "缴费后台管理系统";
	String appCode = Apps.class.getSimpleName();
	
	Class<?>[] children = new Class<?>[]{AdminModule.class};
	
}
