package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Problem;
public interface ProblemRepository extends PagingAndSortingRepository<Problem, Long>,JpaSpecificationExecutor<Problem>{
}

