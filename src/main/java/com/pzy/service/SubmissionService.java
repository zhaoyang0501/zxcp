package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Problem;
import com.pzy.entity.Submission;
import com.pzy.entity.User;
import com.pzy.repository.SubmissionRepository;
import com.pzy.service.autoValidater.AutoValidater;
import com.pzy.service.autoValidater.JavaValidater;

@Service
public class SubmissionService {
	@Autowired
	private SubmissionRepository submissionRepository;
	private AutoValidater autoValidater;
	public List<Submission> findAll(){
		return (List<Submission> )submissionRepository.findAll();
	}
	public Submission validateResult(Submission submission){
		if(submission.getLanguage().equals("3")){
			autoValidater= new JavaValidater();
		}
		autoValidater.validate(submission);
		return submission;
	}
	public Page<Submission> findAll(final int pageNumber, final int pageSize,
			final User user) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Submission> spec = new Specification<Submission>() {
			public Predicate toPredicate(Root<Submission> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (user != null) {
					predicate.getExpressions().add(
							cb.equal(root.get("user").as(User.class),user));
				}
				return predicate;
			}
		};
		Page<Submission> result = (Page<Submission>) submissionRepository.findAll(
				spec, pageRequest);
		return result;
	}
	public Submission save(Submission submission) {
		return submissionRepository.save(submission);
	}
	public Submission find(Long id) {
		return submissionRepository.findOne(id);
	}

	public void delete(Long id) {
	}

	public List<Submission> findHot() {
		return submissionRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.ASC, "count")))
				.getContent();
	}

	public List<Submission> findNew() {
		return submissionRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.DESC, "createDate")))
				.getContent();
	}
	public List<Submission> findByUserAndProblem(User user,Problem problem) {
		return this.submissionRepository.findByUserAndProblem(user,problem);
	}
}