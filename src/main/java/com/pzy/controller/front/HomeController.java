package com.pzy.controller.front;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.MsgBoard;
import com.pzy.entity.Notice;
import com.pzy.entity.Problem;
import com.pzy.entity.Submission;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.ContestProblemService;
import com.pzy.service.MsgBoardService;
import com.pzy.service.NoticeService;
import com.pzy.service.ProblemService;
import com.pzy.service.SubmissionService;
import com.pzy.service.UserService;
/***
 * @author 263608237@qq.com
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
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MsgBoardService msgBoardService;
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("about")
	public String about() {
		return "about";
	}
	/***
	 * 查看留言板
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "msgbox" ,method = RequestMethod.GET)
	public String msgbox(Model model ) {
		model.addAttribute("msgboards",msgBoardService.findAll());
		return "msgbox";
	}
	/***
	 * 发表留言板
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "msgbox" ,method = RequestMethod.POST)
	public String domsgbox(Model model,MsgBoard msgboard ,HttpSession httpSession) {
		httpSession.getAttribute("user");
		msgboard.setUser((User)httpSession.getAttribute("user"));
		msgboard.setCreateDate(new Date());
		msgBoardService.save(msgboard);
		model.addAttribute("msgboards",msgBoardService.findAll());
		return "msgbox";
	}
	/***
	 * 点击问题连接
	 * @param model
	 * @return
	 */
	@RequestMapping("problem")
	public String problem(Model model ) {
		model.addAttribute("categorys",categoryService.findAll());
		return "problem";
	}
	/***
	 * 跳转到注册
	 * @return
	 */
	@RequestMapping(value = "register",method = RequestMethod.GET)
	public String register() {
		return "register";
	}
	/***
	 * 提交注册信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public String doregister(User user,Model model ) {
		model.addAttribute("tip", "注册成功，请登录");
		userService.save(user);
		return "login";
	}
	/***
	 * 登录跳转
	 * @return
	 */
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	/***
	 * 点击登录按钮
	 * @return
	 */
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String dologin(String username,String password,Model model,HttpSession httpSession ) {
		User user=userService.login(username, password);
		model.addAttribute("categorys", categoryService.findAll());
		if(user==null){
			model.addAttribute("tip", "用户名密码不正确");
			return "login";
		}else{
			httpSession.setAttribute("user", user);
			return "problem";
		}
	}
	/***
	 * 退出
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "loginout",method = RequestMethod.GET)
	public String loginout(HttpSession httpSession, Model model) {
		model.addAttribute("categorys", categoryService.findAll());
		httpSession.removeAttribute("user");
		return "problem";
	}
	/***
	 * 查看某个问题详细
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "problemdetail/{id}", method = RequestMethod.GET)
	public String problemdetail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("problem", problemService.find(id));
		return "problemdetail";
	}
	/***
	 * 问题详细-我的提交
	 * @param id
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "problemdetail/{id}/submission", method = RequestMethod.GET)
	public String mysubmission(@PathVariable("id") Long id, Model model,HttpSession httpSession) {
		Problem problem=problemService.find(id);
		model.addAttribute("problem",problem);
		model.addAttribute("submissions", submisstionService.findByUserAndProblem((User)httpSession.getAttribute("user"),problem));
		return "mysubmission";
	}
	/***
	 * ajax提交提交
	 * @param contestProblemid
	 * @param problemid
	 * @param code
	 * @param language
	 * @param model
	 * @param httpSession
	 * @return
	 */
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
	
	@ModelAttribute
	public void getNotice(Model model) {
		List<Notice> list= noticeService.findAll();
			model.addAttribute("notice", list==null||list.size()==0?null:list.get(0));
	}
}

