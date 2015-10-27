package com.pzy.repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.pzy.entity.Submission;
public interface SubmissionRepository extends PagingAndSortingRepository<Submission, Long>,JpaSpecificationExecutor<Submission>{
}

