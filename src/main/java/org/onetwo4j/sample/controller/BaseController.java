package org.onetwo4j.sample.controller;

import org.onetwo.boot.core.web.controller.AbstractBaseController;
import org.onetwo.common.utils.StringUtils;
import org.onetwo4j.sample.utils.WebConstants;

/**
 * @author wayshall
 * <br/>
 */
public class BaseController extends AbstractBaseController {
	
	@Override
	protected String redirect(String path) {
		String newPath = WebConstants.BASE_PATH + StringUtils.appendStartWith(path, "/");
		return super.redirect(newPath);
	}


}
