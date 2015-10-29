package com.pzy.controller.front;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.stat.internal.CategorizedStatistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Problem;
import com.pzy.entity.Submission;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.ContestProblemService;
import com.pzy.service.ProblemService;
import com.pzy.service.SubmissionService;
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
	@Autowired
	private SubmissionService submisstionService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private  ContestProblemService sontestProblemService;
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("problem")
	public String problem(Model model ) {
		model.addAttribute("categorys",categoryService.findAll());
		return "problem";
	}
	@RequestMapping(value = "register",method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String doregister(User user,Model model ) {
		model.addAttribute("tip", "注册成功，请登录");
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
			model.addAttribute("tip", "用户名密码不正确");
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
	@RequestMapping(value = "problemdetail/{id}/submission", method = RequestMethod.GET)
	public String mysubmission(@PathVariable("id") Long id, Model model,HttpSession httpSession) {
		Problem problem=problemService.find(id);
		model.addAttribute("problem",problem);
		model.addAttribute("submissions", submisstionService.findByUserAndProblem((User)httpSession.getAttribute("user"),problem));
		return "mysubmission";
	}
	@ResponseBody
	@RequestMapping(value = "submission/check", method = RequestMethod.POST)
	public Submission submission(Long contestProblemid, Long problemid,String code,String language, Model model,HttpSession httpSession ) {
		Submission bean=new Submission();
		bean.setCreateDate(new Date());
		bean.setInput(code);
		bean.setLanguage(language);
		if(contestProblemid!=null)
			bean.setContestProblem(sontestProblemService.find(contestProblemid));
		bean.setProblem(this.problemService.find(problemid));
		bean.setUser((User)httpSession.getAttribute("user"));
		bean=submisstionService.validateResult(bean);
		submisstionService.save(bean);
		return bean;
	}
}

