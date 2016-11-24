package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.CatagoryDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Catagory;
import com.niit.appleproduct.models.Product;

@Controller
public class LoginController {
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Product product;
	@Autowired
	private CatagoryDAO catagoryDAO;
	@Autowired
	private Catagory catagory;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Cart cart;
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private Buy buy;

	@RequestMapping("/")
	public ModelAndView home(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView("Home");
		String loggedInUser =req.getRemoteUser();
		List <Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		return mv;
	}
	
	@RequestMapping("/Home")
	public ModelAndView Home(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView("Home");
		String loggedInUser =req.getRemoteUser();
		List <Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		return mv;
	}

	@RequestMapping("/portfolio")
	public ModelAndView portfolio(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView("portfolio");
		String loggedInUser =req.getRemoteUser();
		List <Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		return mv;
	}
	
	@RequestMapping("/about")
	public ModelAndView about(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView("about");
		String loggedInUser =req.getRemoteUser();
		List <Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		return mv;
		}
	
	@RequestMapping("/contactus")
	public ModelAndView contactus(HttpServletRequest req) {
		ModelAndView mv=new ModelAndView("contactus");
		String loggedInUser =req.getRemoteUser();
		List <Buy> buyList=buyDAO.list(loggedInUser);
		mv.addObject("buySize", buyList.size());
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
		return mv;
	}
	
	@RequestMapping("/product1")
	    
	    public ModelAndView listPrdct(HttpServletRequest req) {
			String catname=req.getParameter("catname"); 
			Catagory catagory = catagoryDAO.getByName(catname);
			ModelAndView mv=new ModelAndView("product1");
			String loggedInUser =req.getRemoteUser();
			List <Buy> buyList=buyDAO.list(loggedInUser);
			mv.addObject("buySize", buyList.size());
			List <Cart> cartList=cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
			List <Product> plist = productDAO.getByCatagory(catagory.getId());
			Gson gson=new Gson();
			String listp=gson.toJson(plist);
			mv.addObject("listp", listp);
	         return mv;
		}		 
	 @RequestMapping("/productinfo")
	 public ModelAndView pdtinfo(HttpServletRequest req)
	 {
		 	String pdid=req.getParameter("pdid"); 
	    	product=productDAO.get(Integer.parseInt(pdid));
			ModelAndView mv=new ModelAndView("productinfo");
			String loggedInUser =req.getRemoteUser();
			List <Buy> buyList=buyDAO.list(loggedInUser);
			mv.addObject("buySize", buyList.size());
			List <Cart> cartList=cartDAO.list(loggedInUser);
			mv.addObject("cartSize", cartList.size());
			List <Product> pro=productDAO.getByProduct(product.getId());
			mv.addObject("productinfo", pro);
	         return mv;
			
	 
	 }
		
}
