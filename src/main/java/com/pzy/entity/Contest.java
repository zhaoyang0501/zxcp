package com.pzy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "t_contest")
public class Contest {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date begainDate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date endDate;
	/***
	 * <option value="未开始">未开始</option>
										<option value="进行中">进行中</option>
										<option value="已结束">已结束</option>
	 */
	private String state;
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
	public Date getBegainDate() {
		return begainDate;
	}
	public void setBegainDate(Date begainDate) {
		this.begainDate = begainDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	private String type;
	@Column(columnDefinition="TEXT") 
	private String remark;
}
