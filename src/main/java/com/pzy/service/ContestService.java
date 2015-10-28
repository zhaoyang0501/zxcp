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

import com.pzy.entity.Contest;
import com.pzy.repository.ContestRepository;

@Service
public class ContestService {
	@Autowired
	private ContestRepository contestRepository;
	
	public List<Contest> findAll(){
		return (List<Contest> )contestRepository.findAll();
	}
	
	public Page<Contest> findAll(final int pageNumber, final int pageSize,
			final String name) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<Contest> spec = new Specification<Contest>() {
			public Predicate toPredicate(Root<Contest> root,
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
		Page<Contest> result = (Page<Contest>) contestRepository.findAll(
				spec, pageRequest);
		return result;
	}
	public Contest save(Contest contest) {
		return contestRepository.save(contest);
	}
	public Contest find(Long id) {
		return contestRepository.findOne(id);
	}

	public void delete(Long id) {
		Contest contest=this.contestRepository.findOne(id);
		contestRepository.delete(id);
	}

	
}