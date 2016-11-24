package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.dao.UserDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Product;
import com.niit.appleproduct.models.User;

@Controller
public class BuyController {
	
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private Buy buy;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Cart cart;
	@Autowired
	private User user;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Product product;
	
	
	@RequestMapping("/buy")
	public ModelAndView  addbuy(HttpSession session,HttpServletRequest req) {
		ModelAndView mv= new ModelAndView();
		Buy buy=new Buy();
    return mv;

	}
	
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public ModelAndView buypost(@ModelAttribute("buy") Buy buy,HttpSession session,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		String loggedInUser=req.getRemoteUser();
		if(req.getRemoteUser()!=null){			buy.setUsername(user.getFirstname());
			buy.setProductname(product.getName());
			buy.setAddress(user.getAddress());
			buy.setCity(user.getCountry());
			buy.setState(user.getState());
			buy.setMobileno(user.getMobileno());
			buy.setTotal(product.getPrice());
		buyDAO.saveOrUpdate(buy);;
		mv.addObject("successbuy", "You are successfully purchased");
        mv.setViewName("redirect:vieworder");
		}
		else{			mv.addObject("loginbuy", "Please Login to save for wish list");
				mv.setViewName("login");
		}
       	return mv;
	}
	
	@RequestMapping("/buy{id}")
	public ModelAndView  addbuy(@PathVariable("id") int id,HttpSession session,HttpServletRequest req) {
		ModelAndView mv= new ModelAndView(); 
		Buy buy=new Buy();
		String loggedInUser=req.getRemoteUser();
		if(req.getRemoteUser()!=null){
			Product product = productDAO.get(id);
			buy.setId(product.getId());
			buy.setProductname(product.getName());
			buy.setColor(product.getColor());
			buy.setTotal(product.getPrice());
			buy.setDiscription(product.getDiscription());
			User user=userDAO.get(loggedInUser);
			buy.setUsername(loggedInUser);
			buy.setAddress(user.getAddress());
			buy.setCity(user.getCountry());
			buy.setState(user.getState());
			buy.setMobileno(user.getMobileno());
			buyDAO.saveOrUpdate(buy);
			List <Buy> buyList=buyDAO.list(loggedInUser);
			mv.addObject("buySize", buyList.size());
		    mv.addObject("successbuy", "You are successfully purchased");
            mv.setViewName("redirect:vieworder");
		} 
		else{
			mv.addObject("loginbuy", "Please Login to Buy a Product");
			mv.setViewName("login");
		}
       	return mv;
	}
	
	@RequestMapping(value="/vieworder")
	public String vieworder(Model model,HttpSession session){
		Buy buy=new Buy();
		model.addAttribute("buy",buy);
		String loggedInUser= (String) session.getAttribute("loggedInUser");
        model.addAttribute("buyList", buyDAO.list(loggedInUser));
        List <Buy> buyList=buyDAO.list(loggedInUser);
        model.addAttribute("buySize", buyList.size());
        List <Cart> cartList=cartDAO.list(loggedInUser);
        model.addAttribute("cartSize", cartList.size());
		model.addAttribute("BuyList", "Summary");
		return "vieworder";
	}
	
	}