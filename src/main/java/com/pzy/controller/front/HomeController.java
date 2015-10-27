package com.pzy.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzy.service.UserService;
/***
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("problem")
	public String problem() {
		return "problem";
	}
}

