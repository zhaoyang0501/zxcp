package com.pzy.controller;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pzy.entity.ContestProblem;
import com.pzy.service.ContestService;
import com.pzy.service.ContestProblemService;
import com.pzy.service.ProblemService;
/***
 * @author panchaoyang
 *
 */
@Controller
@RequestMapping("/admin/contestproblem")
public class ContestProblemController {
	@Autowired
	private ContestProblemService contestproblemService;
	@Autowired
	private ContestService contestService;
	@Autowired
	private ProblemService problemService;
	
	@RequestMapping("index")
	public String index(Model model){
		model.addAttribute("contests", contestService.findAll());
		model.addAttribute("problems", problemService.findAll());
		return "admin/contestproblem/index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "sEcho", defaultValue = "1") int sEcho,
			@RequestParam(value = "iDisplayStart", defaultValue = "0") int iDisplayStart,
			@RequestParam(value = "iDisplayLength", defaultValue = "10") int iDisplayLength, Long contextid
			) throws ParseException {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<ContestProblem> contestproblems = contestproblemService.findAll(pageNumber, pageSize, contestService.find(contextid));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", contestproblems.getContent());
		map.put("iTotalRecords", contestproblems.getTotalElements());
		map.put("iTotalDisplayRecords", contestproblems.getTotalElements());
		map.put("sEcho", sEcho);
		return map;
	}
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Long cid,Long pid) {
		ContestProblem contestproblem =new ContestProblem();
		contestproblem.setContest(contestService.find(cid));
		contestproblem.setProblem(problemService.find(pid));
		contestproblemService.save(contestproblem);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", "success");
		map.put("msg", "保存成功");
		return map;
	}
	
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			contestproblemService.delete(id);
			map.put("state", "success");
			map.put("msg", "删除成功");
		} catch (Exception e) {
			map.put("state", "error");
			map.put("msg", "删除失败，外键约束");
		}
        return map;
	}

	@RequestMapping(value = "/get/{id}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable Long id ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("object", contestproblemService.find(id));
		map.put("state", "success");
		map.put("msg", "成功");
		return map;
	}
}
