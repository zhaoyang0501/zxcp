package com.pzy.controller.front;
import java.text.ParseException;
import java.util.Date;
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

import com.pzy.entity.Problem;
import com.pzy.entity.Submission;
import com.pzy.entity.User;
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
@RequestMapping("/submission")
public class SubmissionController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ProblemService problemService;
	@Autowired
	private SubmissionService submisstionService;
	@RequestMapping("{id}")
	public String viewDetail(@PathVariable Long id,Model model ) {
		model.addAttribute("bean",submisstionService.find(id));
		return "submissiondetail";
	}
	@RequestMapping("")
	public String index(Model model ) {
		return "submission";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, 
			HttpSession httpSession
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Submission> problems = submisstionService.findAll(pageNumber, pageSize, (User)httpSession.getAttribute("user"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", problems.getContent());
		map.put("iTotalRecords", problems.getTotalElements());
		map.put("iTotalDisplayRecords", problems.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
}

