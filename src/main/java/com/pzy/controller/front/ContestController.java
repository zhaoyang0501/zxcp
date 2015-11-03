package com.pzy.controller.front;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.Contest;
import com.pzy.entity.User;
import com.pzy.service.ContestProblemService;
import com.pzy.service.ContestService;
import com.pzy.service.ProblemService;
import com.pzy.service.SubmissionService;
import com.pzy.service.UserService;
/***
 * @author 263608237@qq.com
 * 前台 比赛相关的控制器
 *
 */
@Controller
@RequestMapping("/contests")
public class ContestController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ProblemService problemService;
	@Autowired
	private ContestService contestService;
	@Autowired
	private ContestProblemService contestProblemService;
	@Autowired
	private SubmissionService submissionService;
	/***
	 * 首页
	 * @param model
	 * @return
	 */
	@RequestMapping("")
	public String index(Model model ) {
		return "contest";
	}
	/***
	 * 查看比赛详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}")
	public String viewDetail(@PathVariable Long id,Model model ) {
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("contestProblems",contestProblemService.findByContest(contestService.find(id)));
		return "contestdetail";
	}
	/***
	 * 比赛--> 题目列表
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}/problems")
	public String contestProblem(@PathVariable Long id,Model model ) {
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("problems",contestProblemService.findByContest(contestService.find(id)));
		return "contestproblem";
	}
	/***
	 * 比赛--> 提交
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}/submission")
	public String submission(@PathVariable Long id,Model model ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("submissions",submissionService.findByContest(contestService.find(id)));
		return "contestsubmission";
	}
	/***
	 * 比赛--> 排名
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}/rankit")
	public String rankit(@PathVariable Long id,Model model ) {
		model.addAttribute("ranks",contestService.createReport(id));
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("bean",contestService.find(id));
		return "contestrank";
	}
	/**排名*/
	@RequestMapping("{id}/rank")
	public String rank(@PathVariable Long id,Model model ) {
		model.addAttribute("ranks",contestService.createReport(id));
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("bean",contestService.find(id));
		return "contestrank";
	}
	/***
	 * 比赛--> 点击其中具体的某个题目
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}/problems/{pid}")
	public String contestProblem(@PathVariable Long id,@PathVariable Long pid, Model model ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("contestProblem",contestProblemService.find(pid));
		return "contestproblemdetail";
	}
	
	/***
	 * 比赛--> 我的提交
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("{id}/problems/{pid}/submission")
	public String submission(@PathVariable Long pid, @PathVariable Long id,Model model ,HttpSession httpSession ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("contestProblem",contestProblemService.find(pid));
		model.addAttribute("submissions",submissionService.findByContestProblemAndUser(contestProblemService.find(pid),(User)httpSession.getAttribute("user")));
		return "mycontestsubmission";
	}
	/**我的提交详细*/
	@RequestMapping("{id}/problems/{pid}/submission/{sid}")
	public String submission(@PathVariable Long sid,@PathVariable Long pid, @PathVariable Long id,Model model ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("contestProblem",contestProblemService.find(pid));
		model.addAttribute("submission",submissionService.find(sid));
		return "mycontestsubmissiondetail";
	}
	/***
	 * AJAX查询所有比赛
	 * @param sEcho
	 * @param iDisplayStart
	 * @param iDisplayLength
	 * @param name
	 * @param httpSession
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, 
			String name,
			HttpSession httpSession
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Contest> problems = contestService.findAll(pageNumber, pageSize, name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", problems.getContent());
		map.put("iTotalRecords", problems.getTotalElements());
		map.put("iTotalDisplayRecords", problems.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
}

