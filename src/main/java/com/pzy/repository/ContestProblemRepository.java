package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Contest;
import com.pzy.entity.ContestProblem;
public interface ContestProblemRepository extends PagingAndSortingRepository<ContestProblem, Long>,JpaSpecificationExecutor<ContestProblem>{
 public List<ContestProblem> findByContest(Contest contest);
}

