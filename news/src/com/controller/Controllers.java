package com.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Content;
import com.po.Nave;
import com.po.Title;
import com.po.User;
import com.service.ContentService;
import com.service.NaveService;
import com.service.TitleService;

@Controller
public class Controllers {
	@RequestMapping("/welcome")
	public String welcome(){
		return "login";
	}
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request){
		if("admin".equals(user.getUsername())&&"admin123".equals(user.getPassword())){
			request.getSession().setAttribute("user", user);
			return "redirect:admin";
		}
		else{ 
		  return "redirect:/index" ;}
	}
	@Autowired
	private NaveService naveService;
	@Autowired
	private TitleService titleService;
	//普通用户界面
	@RequestMapping("/index")
	public String index( Nave nave,Model model){
		List<Title> titles = titleService.findTitle(null);
		model.addAttribute("titles", titles);
		List<Nave> naves = naveService.findByTitle(nave);
		model.addAttribute("nave", naves);
		return "head";
	}
	
	//ajax异步请求，当点击各类主题时查询出其包含的内容
	@ResponseBody
	@RequestMapping("/findByTitle")
	public List<Nave> findByTitle( @RequestBody  Nave nave){
		List<Nave> naves=naveService.findByTitle(nave);
    	return naves;	
	}
	
	//管理员界面
	@RequestMapping("/admin")
	public String admin(Title title, Model model){
		List<Title> titles = titleService.findTitle(null);
		model.addAttribute("titles", titles);
//		System.out.println(user.getUsername());
//		model.addAttribute("user", user);
		return "admin";
	}
	
	//添加主题
	@RequestMapping("/addtitle")
	public String addtitle(Title title){
		List<Title> titles = titleService.findTitle(null);
		int rs =0;
		//用来过滤已经存在的主题不能再添加，以及主题为空时不添加。
		for (Title title2 : titles) {
			if(title.getTitle().equals(title2.getTitle())||title.getTitle().equals("")){
				rs=-1;
			}
		}
		if(rs==0){
			rs=titleService.addTitle(title);
			System.out.println("添加主题成功");
		}else {
			System.out.println("添加主题失败，主题已存在或输入的主题为空");
		}
		return "redirect:admin";
	}
	
	//修改主题
	@RequestMapping("/updateTitle")
	public String updateTitle(Title title,HttpServletRequest request){
		//解决post方式提交的乱码
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		titleService.updateTitle(title);
		System.out.println("修改主题成功");
		return "redirect:/admin" ;
	}
	
	
	
	
	//删除主题
	@RequestMapping("/deleteTitle")
	public String deleteTitle(Nave nave,Title title){
		System.out.println(title.getTitle());
		//删除前先判断一下该主题下内容是否为空，为空则删除。
		List<Nave> naves = naveService.findByTitle(nave);
		if(naves.size()==0){
			titleService.deleteTitle(title);
			System.out.println("删除主题成功");
		 }
		System.out.println("删除主题失败，该主题下有内容，请先删除内容");
		return "redirect:/admin";
	}
	
	//添加新闻
	@RequestMapping("/addnews")
	public String addnews(Model model){
		List<Title> titles = titleService.findTitle(null);
		model.addAttribute("titles", titles);
		return "addNews";
	}
	@Autowired
	private ContentService contentService;
	@RequestMapping("/add")
	public String add(Title title,Content content){
		Content content2=contentService.listContent(content);
		//设置如果新闻名已存在则不添加
		if(content2==null){
		List<Title> titles = titleService.findTitle(title);
		Integer tid=null;
		for (Title title2 : titles) {
			 tid=title2.getId();
		 }
		content.setTid(tid);
	    content.setDate(new Date().toLocaleString());
	    contentService.addContent(content);
	    System.out.println("添加新闻成功");
		}
		System.out.println("添加新闻失败,新闻已存在");
		return "redirect:/admin";
	}
	
	//新闻详情页
	@RequestMapping("/listContent")
	public String listContent(Content content,Title title,Model model){
		Content content2=contentService.listContent(content);
		title.setId(content2.getTid());
		List<Title> titles=titleService.findTitle(title);
		for ( Title title2 :titles) {
			model.addAttribute("title2", title2);
		}
		model.addAttribute("contents", content2);
		return  "content";
		
	}
}
