package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.UserDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.User;

@Controller
public class UserController {
	AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private User user;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Cart cart;
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private Buy buy;


	@RequestMapping("/reg")
	public String reg(Model model){
		model.addAttribute("user", user); 
		model.addAttribute("isuserClickedRegisterHere", "true"); 
		return "reg";
	}

	@RequestMapping(value = "reg", method = RequestMethod.POST)
	public ModelAndView regpost(@ModelAttribute("user") User user) {
		userDAO.saveOrUpdate(user);
		ModelAndView mv = new ModelAndView("/login");
		mv.addObject("successMessage", "You are successfully registered please login with your details");
		return mv;
	}

/*	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", user);
		model.addAttribute("isuserClickedLoginHere", "true");
		return "login";
	}
*/	
	
	@RequestMapping("/check")
    public ModelAndView check(HttpServletRequest req,HttpSession session) {
		
		String loggedInUser =req.getRemoteUser();
		ModelAndView mv= new ModelAndView("check");
		 session.setAttribute("loggedInUser",req.getRemoteUser());
		mv.addObject("loggedInUser",loggedInUser);
		List<Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		List<Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
	    return mv;
    }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
		@RequestParam(value = "logout", required = false) String logout ,HttpSession session,HttpServletRequest req,Authentication auth) {
		
		ModelAndView mv = new ModelAndView();
		if (error != null) {
			mv.addObject("errorMessage", "Invalid Credentials..! Not Yet Registered");
			mv.setViewName("login");
		}
		
		if (logout != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
			session.invalidate();
			mv.addObject("logoutsuccess", "logged out successfully.");
			mv.setViewName("Home");
		}
		else{
		     mv.setViewName("login");
		}	
		return mv;
	}
	
	@RequestMapping("/admin")
	 public String admin(@RequestParam(value="error",required=false) String error,Model model,Authentication auth)
	{
	return "admin";
	}
	
	/*
@RequestMapping(value ="login",method=RequestMethod.POST)
	public ModelAndView loginpost(HttpServletRequest request, HttpSession session) {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ModelAndView mv=new ModelAndView("/login");
		boolean isValidUser=userDAO.isValidUser(username,password);
		if(isValidUser==true)
		{
			user=userDAO.get(username);
			session.setAttribute("loggedInUser","Welcome "+user.getFirstname()+"...!!!");
			if(user.getRole().equals("ROLE_ADMIN"))
			{	
				 mv= new ModelAndView("/admin");
			}else{
				 mv= new ModelAndView("/Home");
				 System.out.print(user.getFirstname());
			}	
		}
		else{
			mv.addObject("invalidCredentials","true");
			mv.addObject("errorMessage","Invalid Credentials..! Not Yet Registered");
			}
	return mv;
	}
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("/Home");
		session.invalidate();
		session = request.getSession(true);
		mv.addObject("loggedOut", "true");
		mv.addObject("logoutsuccess", "Loggedout Successfully");
		return mv;
	}
*/
}
