package com.blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.blog.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{
	
	@Query(value = "SELECT * FROM board WHERE content like %:searchVal%", nativeQuery=true)
	public List<Board> findByContent(@Param("searchVal") String searchVal);
}
