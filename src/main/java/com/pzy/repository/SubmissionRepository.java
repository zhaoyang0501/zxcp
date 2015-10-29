package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Contest;
import com.pzy.entity.ContestProblem;
import com.pzy.entity.Problem;
import com.pzy.entity.Submission;
import com.pzy.entity.User;
public interface SubmissionRepository extends PagingAndSortingRepository<Submission, Long>,JpaSpecificationExecutor<Submission>{
	public List<Submission> findByUserAndProblem(User user,Problem prpblem);
	public List<Submission> findByContestProblemContest(Contest contest);
	public List<Submission> findByContestProblem(ContestProblem contestProblem);
	public List<Submission> findByContestProblemAndUser(ContestProblem contestProblem,User user);
}

