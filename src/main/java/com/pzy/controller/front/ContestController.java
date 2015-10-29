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
 * @author Administrator
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
	@RequestMapping("{id}")
	public String viewDetail(@PathVariable Long id,Model model ) {
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("contestProblems",contestProblemService.findByContest(contestService.find(id)));
		return "contestdetail";
	}
	@RequestMapping("{id}/problems")
	public String contestProblem(@PathVariable Long id,Model model ) {
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("problems",contestProblemService.findByContest(contestService.find(id)));
		return "contestproblem";
	}
	@RequestMapping("{id}/submission")
	public String submission(@PathVariable Long id,Model model ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("bean",contestService.find(id));
		model.addAttribute("submissions",submissionService.findByContest(contestService.find(id)));
		return "contestsubmission";
	}
	/**排名*/
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
	
	@RequestMapping("{id}/problems/{pid}")
	public String contestProblem(@PathVariable Long id,@PathVariable Long pid, Model model ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("contestProblem",contestProblemService.find(id));
		return "contestproblemdetail";
	}
	
	/**我的提交*/
	@RequestMapping("{id}/problems/{pid}/submission")
	public String submission(@PathVariable Long pid, @PathVariable Long id,Model model ,HttpSession httpSession ) {
		model.addAttribute("contest",contestService.find(id));
		model.addAttribute("contestProblem",contestProblemService.find(id));
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
	@RequestMapping("")
	public String index(Model model ) {
		return "contest";
	}
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

