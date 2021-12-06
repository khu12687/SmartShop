package kr.ac.kopo.smartshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.smartshop.model.Member;
import kr.ac.kopo.smartshop.service.MemberService;

@Controller
public class RootController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		if(memberService.checkId(id))
			return "OK";
		else
			return "FAIL";	
	}
	
	@GetMapping("/signup")	
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Member member) {
		memberService.add(member);
		
		return "redirect:list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member) {
		if(memberService.login(member)) {

			return "redirect:.";
		}
		
		return "redirect:.";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
}
