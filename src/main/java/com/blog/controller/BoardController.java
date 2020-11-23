package com.blog.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.blog.model.Board;
import com.blog.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	/**
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/home")
	public String home(Model model) {
		List<Board> boardList = boardService.boardList();
		model.addAttribute("list", boardList);
		return "index";
	}
	
	/**
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/detail/{id}")
	public String boardDetail(Model model, @PathVariable int id) {
		Optional<Board> boardO = boardService.boadDetail(id);
		Board board = boardO.get();
		model.addAttribute("board", board);
		return "detail";
	}
	
	/**
	 * 
	 * @return
	 */
	@GetMapping("/boardWritePage")
	public String boardWritePage() {
		return "write";
	}
	
	/**
	 * 
	 * @param board
	 * @return
	 */
	@PostMapping("/boardWrite")
	public String boardWrite(Board board) {
		boardService.boardWrite(board);
		return "redirect:/home";
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/boardDelete/{id}")
	public String boardDelete(@PathVariable int id) {
		System.out.println("delete Controller");
		boardService.boardDelete(id);
		return "redirect:/home";
	}
	
	/**
	 * 
	 * @param board
	 * @return
	 */
	@PostMapping("/boardUpdate")
	public String boardUpdate(int id, String title, String content, String createDate) {
		Board board = new Board();
		System.out.println(id);
		board.setId(id);
		board.setTitle(title);
		board.setContent(content);
		board.setCreateDate(LocalDate.parse(createDate, DateTimeFormatter.ISO_DATE));
		board.setUpdateDate(LocalDate.now());
		boardService.boardWrite(board);
		return "redirect:/home";
	}
	
	/**
	 * 
	 * @param model
	 * @param searchVal
	 * @return index.jsp
	 */
	@GetMapping("/search/{searchVal}")
	public String Search(Model model, @PathVariable String searchVal) {
		List<Board> list = boardService.boardSearch(searchVal);
		model.addAttribute("list", list);
		model.addAttribute("search", "search");
		return "index";
	}
}
