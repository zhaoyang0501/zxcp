package com.pzy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@Table(name = "t_Submission")
public class Submission {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch = FetchType.EAGER)
	private Problem problem;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date createDate;
	@ManyToOne(fetch = FetchType.EAGER)
	private ContestProblem contestProblem;
	
	private Double spend;
	
	public Double getSpend() {
		return spend;
	}
	public void setSpend(Double spend) {
		this.spend = spend;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Problem getProblem() {
		return problem;
	}
	public void setProblem(Problem problem) {
		this.problem = problem;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	private String result;
	private String language;
	public String input;
	private String  state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public ContestProblem getContestProblem() {
		return contestProblem;
	}
	public void setContestProblem(ContestProblem contestProblem) {
		this.contestProblem = contestProblem;
	}
}