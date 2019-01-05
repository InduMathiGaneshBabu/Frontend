package com.electronics.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.Dao.CartDao;
import com.electronics.Dao.OrderDetailDao;
import com.electronics.Dao.UserDetailDao;
import com.electronics.model.Cart;
import com.electronics.model.OrderDetail;
import com.electronics.model.UserDetail;

import net.bytebuddy.asm.Advice.This;

@Controller
public class OrderController
{
	
	@Autowired
	OrderDetailDao orderDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	UserDetailDao userDao;
	
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String PaymentProcess(@RequestParam("pmode")String pmode,HttpSession session,Model m)
	{
		String username=(String)session.getAttribute("username");
		
		List<Cart> listcartitems=cartDao.listCartItems(username);
		
		OrderDetail orderdetail=new OrderDetail();
		orderdetail.setOrderdate(new Date());
		orderdetail.setPmode(pmode);
		orderdetail.setUsername(username);
		orderdetail.setTotalshoppingamount(this.grandtotal(listcartitems));
		orderDao.PaymentProcess(orderdetail);
		
		if(orderDao.UpdateCartItemStatus(username))
		{
			m.addAttribute("grandtotal",this.grandtotal(listcartitems));
			m.addAttribute("listcart",listcartitems);
			UserDetail userdetail=userDao.getuserdetail(username);
			m.addAttribute("userdetail",userdetail);
			m.addAttribute("Order",orderdetail);
			
		}
		
		
		
		return "Receipt";
	}
	
		
	
	
	
	
	
	
	public int grandtotal(List<Cart> listcartitems)
	{
		int grandtotal=0;
		int count=0;
		while(count<listcartitems.size())
		{
			Cart cart=listcartitems.get(count);
			grandtotal=(grandtotal+(cart.getQuantity()*cart.getPrice()));
			count++;
		}
		return grandtotal;
	}
	
	
	

}
