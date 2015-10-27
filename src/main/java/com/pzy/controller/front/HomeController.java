package com.pzy.controller.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pzy.entity.User;
import com.pzy.service.ProblemService;
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
	@Autowired
	private ProblemService problemService;
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("problem")
	public String problem() {
		return "problem";
	}
	@RequestMapping(value = "register",method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String doregister(User user,Model model ) {
		model.addAttribute("tip", "ע��ɹ������¼");
		userService.save(user);
		return "login";
	}
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String dologin(String username,String password,Model model,HttpSession httpSession ) {
		User user=userService.login(username, password);
		if(user==null){
			model.addAttribute("tip", "�û������벻��ȷ");
			return "login";
		}else{
			httpSession.setAttribute("user", user);
			return "problem";
		}
	}
	
	@RequestMapping(value = "loginout",method = RequestMethod.GET)
	public String loginout(HttpSession httpSession) {
		httpSession.removeAttribute("user");
		return "problem";
	}
	
	@RequestMapping(value = "problemdetail/{id}", method = RequestMethod.GET)
	public String problemdetail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("problem", problemService.find(id));
		return "problemdetail";
	}
}
