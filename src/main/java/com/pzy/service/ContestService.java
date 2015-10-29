package com.pzy.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pzy.entity.Contest;
import com.pzy.entity.Rank;
import com.pzy.repository.ContestRepository;

@Service
public class ContestService {
	@Autowired
	private ContestRepository contestRepository;
	@Autowired
	private EntityManagerFactory entityManagerFactory;
	public List<Rank> createReport(Long cid){
		EntityManager em=entityManagerFactory.createEntityManager();
		em.getTransaction().begin();
		Query query = em.createNativeQuery("{call prc_report(?)}");
		query.setParameter(1,cid);
		query.executeUpdate();
		
		Query query2 = em.createNativeQuery(" SELECT *   FROM t_rank ORDER BY"
				+ " if(num1=0,0,1)+if(num2=0,0,1)+if(num3=0,0,1)+if(num4=0,0,1)+if(num5=0,0,1)+if(num6=0,0,1)+if(num7=0,0,1) desc ,"
				+ "(num1+num2+num3+num4+num5+num6+num7) asc",Rank.class);
	
		List<Rank> list=query2.getResultList();
		
		em.getTransaction().commit();
		em.close();
		return list;
	}
	
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