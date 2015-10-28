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
import com.pzy.entity.ContestProblem;
import com.pzy.repository.ContestProblemRepository;

@Service
public class ContestProblemService {
	@Autowired
	private ContestProblemRepository contestproblemRepository;
	
	public List<ContestProblem> findAll(){
		return (List<ContestProblem> )contestproblemRepository.findAll();
	}
	
	public Page<ContestProblem> findAll(final int pageNumber, final int pageSize,
			final Contest contest) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize,
				new Sort(Direction.DESC, "id"));

		Specification<ContestProblem> spec = new Specification<ContestProblem>() {
			public Predicate toPredicate(Root<ContestProblem> root,
					CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (contest != null) {
					predicate.getExpressions().add(
							cb.equal(root.get("contest").as(Contest.class),contest));
				}
				return predicate;
			}
		};
		Page<ContestProblem> result = (Page<ContestProblem>) contestproblemRepository.findAll(
				spec, pageRequest);
		return result;
	}
	public ContestProblem save(ContestProblem contestproblem) {
		return contestproblemRepository.save(contestproblem);
	}
	public ContestProblem find(Long id) {
		return contestproblemRepository.findOne(id);
	}

	public void delete(Long id) {
		ContestProblem contestproblem=this.contestproblemRepository.findOne(id);
		contestproblemRepository.delete(id);
	}
	public List<ContestProblem> findByContest(Contest contest){
		return contestproblemRepository.findByContest(contest);
	}
	
}