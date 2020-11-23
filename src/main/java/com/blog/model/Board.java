package com.blog.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //기본키설정
	private int id;
	//글 제목
	private String title;
	//글 내용
	private String content;
	//작성일
	@CreationTimestamp
	private LocalDate createDate;
	//수정일
	@CreationTimestamp
	private LocalDate updateDate;
}
