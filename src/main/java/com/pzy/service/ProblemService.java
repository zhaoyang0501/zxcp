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
import com.pzy.repository.ProblemRepository;

@Service
public class ProblemService {
	@Autowired
	private ProblemRepository problemRepository;
	
	public List<Problem> findAll(){
		return (List<Problem> )problemRepository.findAll();
	}
	
	public Page<Problem> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Problem> spec = new Specification<Problem>() {
			public Predicate toPredicate(Root<Problem> root,
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
		Page<Problem> result = (Page<Problem>) problemRepository.findAll(
				spec, pageRequest);
		return result;
	}
	public Problem save(Problem problem) {
		return problemRepository.save(problem);
	}
	public Problem find(Long id) {
		return problemRepository.findOne(id);
	}

	public void delete(Long id) {
		Problem problem=this.problemRepository.findOne(id);
		problemRepository.delete(id);
	}

	public List<Problem> findHot() {
		return problemRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.ASC, "count")))
				.getContent();
	}

	public List<Problem> findNew() {
		return problemRepository.findAll(
				new PageRequest(0, 6, new Sort(Direction.DESC, "createDate")))
				.getContent();
	}
}