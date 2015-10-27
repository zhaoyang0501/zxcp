package com.pzy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "t_Problem")
public class Problem {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String remark;
	private String input;
	private String output;
	private String inputemp;
	private String outputemp;
	/*用于验证数据防止作弊**/
	private String inputok;
	private String outputok;
	private String type;
	private String hard;
	private Date createDate;
	private Long timelimit;
	private Long cpulimit;
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getTimelimit() {
		return timelimit;
	}
	public void setTimelimit(Long timelimit) {
		this.timelimit = timelimit;
	}
	public Long getCpulimit() {
		return cpulimit;
	}
	public void setCpulimit(Long cpulimit) {
		this.cpulimit = cpulimit;
	}
	public String getHard() {
		return hard;
	}
	public void setHard(String hard) {
		this.hard = hard;
	}
	private String reference;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public String getInputemp() {
		return inputemp;
	}
	public void setInputemp(String inputemp) {
		this.inputemp = inputemp;
	}
	public String getOutputemp() {
		return outputemp;
	}
	public void setOutputemp(String outputemp) {
		this.outputemp = outputemp;
	}
	public String getInputok() {
		return inputok;
	}
	public void setInputok(String inputok) {
		this.inputok = inputok;
	}
	public String getOutputok() {
		return outputok;
	}
	public void setOutputok(String outputok) {
		this.outputok = outputok;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
}
