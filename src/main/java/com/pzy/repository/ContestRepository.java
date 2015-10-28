package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Contest;
public interface ContestRepository extends PagingAndSortingRepository<Contest, Long>,JpaSpecificationExecutor<Contest>{
}

