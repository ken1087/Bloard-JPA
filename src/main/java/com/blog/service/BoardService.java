package com.blog.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.model.Board;
import com.blog.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	/**
	 * 
	 * @return
	 */
	public List<Board> boardList() {
		return boardRepository.findAll();
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public Optional<Board> boadDetail(int id) {
		return boardRepository.findById(id);
	}
	
	/**
	 * 
	 * @param board
	 */
	public void boardWrite(Board board) {
		boardRepository.save(board);
	}
	
	/**
	 * 
	 * @param id
	 */
	public void boardDelete(int id) {
		boardRepository.deleteById(id);
	}
	
	/**
	 * 
	 * @param searchVal
	 * @return Board
	 */
	public List<Board> boardSearch(String searchVal) {
		return boardRepository.findByContent(searchVal);
	}
}
