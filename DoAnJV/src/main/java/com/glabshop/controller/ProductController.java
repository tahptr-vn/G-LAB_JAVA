package com.glabshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glabshop.bean.MailInfo;
import com.glabshop.dao.ProductDAO;
import com.glabshop.entity.Product;
import com.glabshop.service.CartService;
import com.glabshop.service.CookieService;
import com.glabshop.service.MailService;

@Controller
public class ProductController {

	@Autowired
	ProductDAO pdao;

	@Autowired
	CookieService cookie;

	@Autowired
	MailService mail;
	

	@RequestMapping("/product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("listsp", list);
		return "product/list";
	}
	
	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("listsp", list);
		return "product/list";
	}
	@RequestMapping("/product/{cid}/{bid}")
	public String listByCategory(Model model,@PathVariable("cid") String categoryName,@PathVariable("bid") String brandName) {
		List<Product> list = pdao.findByBrandName(brandName);
		model.addAttribute("listsp", list);
		return "product/list";
	}
	@RequestMapping("/product/{cid}")
	public String listByCategorys1(Model model, @PathVariable("cid") String categoryName) {
		List<Product> list = pdao.findByCategoryName(categoryName);
		model.addAttribute("listsp", list);
		return "product/list";
	}
	
	@RequestMapping("/product/detail/{cid}")
	public String detail(Model model, @PathVariable("cid") Integer id) {
		Product prod = pdao.findById(id);
		model.addAttribute("prod", prod);

		// Tăng số lần xem
		prod.setViewCount(prod.getViewCount() + 1);
		pdao.update(prod);

		// Hàng cùng loại
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);

		// Hàng đã xem
		Cookie viewed = cookie.read("viewed");
		String value = id.toString();
		if (viewed != null) {
			value = viewed.getValue();
			value += "," + id.toString();
		}
		cookie.create("viewed", value, 10);
		List<Product> viewed_list = pdao.findByIds(value);
		model.addAttribute("viewed", viewed_list);

		return "product/detail";
	}

	@ResponseBody
	@RequestMapping("/product/send-to-friend")
	public String sendToFriend(Model model,MailInfo info,HttpServletRequest req) {
			//send mail
			info.setSubject("Thông tin hàng hóa");
			try {
				String id=req.getParameter("id");
				String link=req.getRequestURL().toString().replace("send-to-friend", "detail/"+id);
				info.setBody(info.getBody()+"<hr><a href='"+link+"'>Xem chi tiết...</a>");
				mail.send(info);
				return "true";
			} catch (Exception e) {
				e.printStackTrace();
				return "false";
			}
	}
}
