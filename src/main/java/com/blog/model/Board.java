package com.blog.model;

import java.time.LocalDate;

import javax.persistence.Entity;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
public class Board {
	private int id;
	private String title;
	private String content;
	@CreationTimestamp
	private LocalDate createDate;
	@CreationTimestamp
	private LocalDate updateDate;
}
