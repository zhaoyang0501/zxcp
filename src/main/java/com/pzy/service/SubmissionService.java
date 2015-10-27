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

import com.pzy.entity.Submission;
import com.pzy.repository.SubmissionRepository;

@Service
public class SubmissionService {
	@Autowired
	private SubmissionRepository submissionRepository;
	
	public List<Submission> findAll(){
		return (List<Submission> )submissionRepository.findAll();
	}
	public Submission validateResult(Submission submission){
		submission.setResult("±‡“Î¥ÌŒÛ");
		submission.setState("±‡“Î¥ÌŒÛ");
		return submission;
	}
	public Page<Submission> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Submission> spec = new Specification<Submission>() {
			public Predicate toPredicate(Root<Submission> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (name != null) {
					predicate.getExpressions().add(
							cb.like(root.get("name").as(String.class),"%"+ name
									+ "%"));
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
}