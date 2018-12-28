package com.electronics.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.electronics.Dao.CartDao;
import com.electronics.Dao.ProductDao;
import com.electronics.model.Cart;
import com.electronics.model.Product;

@Controller
public class CartController
{
	
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDao productDao;
	
	
	
	@RequestMapping(value="/addtocart/{productid}",method=RequestMethod.POST)
	public String AddtoCart(@PathVariable("productid")int productid,Model m,@RequestParam("quantity")int quantity,HttpSession session)
	{
		Cart cart=new Cart();
	Product product=productDao.getProduct(productid);
	cart.setProductid(product.getProductid());
	cart.setProductname(product.getProductname());
	cart.setPrice(product.getPrice());
	cart.setQuantity(quantity);
	cart.setStatus("N");
	cart.setUsername("babu");
	cartDao.addToCart(cart);
	List<Cart> listcartitems=cartDao.listCartItems("babu");
	m.addAttribute("cartlist",listcartitems);
	m.addAttribute("grandtotal",this.grandtotal(listcartitems));
	return "Cart1";
}
	public int grandtotal(List<Cart> listcartitems)
	{
		int grandtotal=0;
		int count=0;
		while(count<listcartitems.size())
		{
			Cart cart=listcartitems.get(count);
			grandtotal=grandtotal+(cart.getQuantity()*cart.getPrice());
			count++;
		}
		return grandtotal;
	}
	
	
	@RequestMapping(value="/editcart/{cartid}")
	public String Editcart(@PathVariable("cartid")int cartid,Model m,HttpSession session)
	{
		Cart cart=cartDao.getCartItem(cartid);
		m.addAttribute("cart",cart);
		return "UpdateCart";
		
	}
	
	@RequestMapping(value="/updatecart/{cartid}", method=RequestMethod.POST)
	public String UpdateCart(@PathVariable("cartid")int cartid,@RequestParam("quantity")int quantity,Model m,HttpSession session)
	{
		Cart cart=cartDao.getCartItem(cartid);
		cart.setQuantity(quantity);
		cartDao.updateCartItem(cart);
		List<Cart> listcartitems=cartDao.listCartItems("babu");
		m.addAttribute("cartlist",listcartitems);
		m.addAttribute("grandtotal",this.grandtotal(listcartitems));
		return "Cart1";
	}
	
	@RequestMapping(value="/deletecart/{cartid}")
	public String DeleteCart(@PathVariable("cartid")int cartid,Model m,HttpSession session)
	{
	   Cart cart=cartDao.getCartItem(cartid);
	   cartDao.deleteItemFromCart(cart);
	   List<Cart> listcartitems=cartDao.listCartItems("babu");
		m.addAttribute("cartlist",listcartitems);
		m.addAttribute("grandtotal",this.grandtotal(listcartitems));
	   return "Cart1";
	}
		
		
		
	

}
