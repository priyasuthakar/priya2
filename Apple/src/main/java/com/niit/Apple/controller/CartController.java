package com.niit.Apple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.appleproduct.dao.BuyDAO;
import com.niit.appleproduct.dao.CartDAO;
import com.niit.appleproduct.dao.ProductDAO;
import com.niit.appleproduct.models.Buy;
import com.niit.appleproduct.models.Cart;
import com.niit.appleproduct.models.Product;
import com.niit.appleproduct.models.User;

@Controller
public class CartController {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private Product product;
	@Autowired
	private Cart cart;
	@Autowired
	private User user;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private Buy buy;
			
	@RequestMapping("/cart{id}")
	public ModelAndView  addcart(@PathVariable("id") int id,HttpSession session,HttpServletRequest req) {
		Cart cart=new Cart();
		ModelAndView mv= new ModelAndView(); 
	   	String loggedInUser=req.getRemoteUser();
		if(req.getRemoteUser()!=null){
		Product product = productDAO.get(id); 
		cart.setId(product.getId());
		cart.setUsername(loggedInUser);
		cart.setPrice(product.getPrice());
		cart.setPname(product.getName());
		cartDAO.saveOrUpdate(cart);
		List <Cart> cartList=cartDAO.list(loggedInUser);
		mv.addObject("cartSize", cartList.size());
        mv.setViewName("redirect:viewcart");
		}
		else{
			mv.addObject("logincart", "Please Login to save for wish list");
			mv.setViewName("login");
		}
       return mv;
	}
	
	@RequestMapping(value="/viewcart")
	public String viewcart(Model model,HttpSession session){
		Cart cart=new Cart();
		model.addAttribute("cart",cart);
		String loggedInUser= (String) session.getAttribute("loggedInUser");
        model.addAttribute("cartList", cartDAO.list(loggedInUser));
        List <Cart> cartList=cartDAO.list(loggedInUser);
        model.addAttribute("cartSize", cartList.size());
        List <Buy> buyList=buyDAO.list(loggedInUser);
        model.addAttribute("buySize", buyList.size());
	/*	model.addAttribute("totalAmount", cartDAO.getTotalsize(loggedInUser));
	*/	model.addAttribute("CartList", "CART LIST");
		return "viewcart";
		
	}
	@RequestMapping("/del{id}")
	public String deletecategory(@PathVariable("id") int id) {
		cartDAO.delete(id);
		return "redirect:/viewcart";
	}
	}