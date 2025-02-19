package com.klef.jfsd.springboot.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
//import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.model.BookAndUser;
import com.klef.jfsd.springboot.model.Books;
import com.klef.jfsd.springboot.model.Librarian;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.AdminService;
//import com.klef.jfsd.springboot.service.AssignmentService;
import com.klef.jfsd.springboot.service.EmailService;
import com.klef.jfsd.springboot.service.LibrarianService;
import com.klef.jfsd.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController 
{
	@Autowired
	private LibrarianService librarianService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index()
	{
		return "index";
	}
	
	@GetMapping("libreg") 
	public ModelAndView libregistration()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("libreg");
	    return mv;
	}
	
	@GetMapping("libSignInAndRegistration") //URI & method name can be different
	public ModelAndView libSignInAndRegistration()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("libSignInAndRegistration");
	    return mv;
	}
	
	@GetMapping("libhome") 
	public ModelAndView libhome()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("libhome");
	    return mv;
	}
	
//	@GetMapping("viewallcsebooks") 
//	public ModelAndView cse()
//	{
//		ModelAndView mv = new ModelAndView();
//	    mv.setViewName("viewallcsebooks");
//	    
//	    List<Books> bookslist = librarianService.viewallcsebooks();
//	    mv.addObject("csebooks", bookslist);	
//	    
//	    return mv;
//	}
	
	@GetMapping("viewallusers")
	public ModelAndView viewallusers()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewallusers");
	    
	    List<User> userlist = librarianService.viewallusers();
	    mv.addObject("users", userlist);	
	    
	    return mv;
	}
	
	@GetMapping("viewbook")
	public ModelAndView viewempdemo(@RequestParam("id") int bid)
	{
		Books book = librarianService.viewbookbyid(bid);
		List<BookAndUser> bookAndUser = librarianService.viewbybookid(bid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewbookbyid");
	    mv.addObject("book", book);
	    mv.addObject("bookAndUser", bookAndUser);
	    return mv;
	}
	
	@GetMapping("viewbookwithuser")
	public ModelAndView viewbookwithuser(@RequestParam("id") int id)
	{
		BookAndUser bu = librarianService.viewbookanduserbyid(id);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewbookwithuser");
	    
	    LocalDate date1 = LocalDate.parse(bu.getDuedate());
	    LocalDate date2 = LocalDate.now();
	    
	    Period age = Period.between(date1, date2);

	    int days = age.getDays();
	    
	    System.out.println(days);
	    
	    int due=0;
	    
	    if(days>0 && days<=10)
	    {
	    	due=50;
	    }
	    else if(days>10 && days<=20)
	    {
	    	due=50+100;
	    }
	    else if(days>20 && days<=30)
	    {
	    	due=50+100+150;
	    }
	    else if(days>30 && days<=40)
	    {
	    	due=50+100+150+200;
	    }
	    else if(days>40 && days<=50)
	    {
	    	due=50+100+150+200+250;
	    }
	    else if(days>50)
	    {
	    	due=50+100+150+200+250+300;
	    }
	    
	    due=due*bu.getNoofcopies();
	    
	    mv.addObject("due", due);
	    mv.addObject("bu", bu);
	    return mv;
	}
	
	@GetMapping("setstatus")
	public ModelAndView setstatus(@RequestParam("id") int uid, @RequestParam("status") boolean ustatus)
	{
		int n = librarianService.setStatus(uid, ustatus);
		String msg=null;
		ModelAndView mv = new ModelAndView();
		if(n>0)
		{
			msg="Updated Successfully";
		    mv.setViewName("viewallusers");
		    List<User> userlist = librarianService.viewallusers();
		    mv.addObject("users", userlist);
		    mv.addObject("msg", msg);
		}
		else
		{
			msg="Updated Failed";
		    mv.setViewName("viewallusers");
		    List<User> userlist = librarianService.viewallusers();
		    mv.addObject("users", userlist);
		    mv.addObject("msg", msg);
		}
	    return mv;
	}
	
	@GetMapping("adminsetstatus")
	public ModelAndView adminsetstatus(@RequestParam("id") int uid, @RequestParam("status") boolean ustatus)
	{
		int n = librarianService.setStatus(uid, ustatus);
		String msg=null;
		ModelAndView mv = new ModelAndView();
		if(n>0)
		{
			msg="Updated Successfully";
		    mv.setViewName("adminUser");
		    List<User> userlist = librarianService.viewallusers();
		    mv.addObject("users", userlist);
		    mv.addObject("msg", msg);
		}
		else
		{
			msg="Updated Failed";
		    mv.setViewName("adminUser");
		    List<User> userlist = librarianService.viewallusers();
		    mv.addObject("users", userlist);
		    mv.addObject("msg", msg);
		}
	    return mv;
	}
	
	@GetMapping("addabook") 
	public ModelAndView addabook()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("addabook");
	    return mv;
	}
	
	@GetMapping("addauserwithbook") 
	public ModelAndView addastudnet(@RequestParam("id") int bid)
	{
		Books book = librarianService.viewbookbyid(bid);
		List<User> user = librarianService.viewallusers();
		
//		System.out.println(user);
		ModelAndView mv = new ModelAndView();
		
	    mv.setViewName("addauser");
	    mv.addObject("book", book);
	    mv.addObject("userdata", user);
	    return mv;
	}
	
	@PostMapping("insertlib")
	public ModelAndView insertaction(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		try
		{
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String contact = request.getParameter("contact");
			
			Librarian lib = new Librarian();
			lib.setName(name);
			lib.setGender(gender);
			lib.setDateofbirth(dob);
			lib.setEmail(email);
			lib.setPassword(pwd);
			lib.setContact(contact);
			lib.setActive(true);
		    
		    msg = librarianService.addLibrarian(lib);
		    
		    mv.setViewName("displaymsg");
		    mv.addObject("message", msg);
		}
		catch(Exception e)
		{
			msg = e.getMessage();
			
			mv.setViewName("displayerror");
			mv.addObject("message", msg);
		}
		
		return mv;
	}
	
	@PostMapping("addbook")
	public ModelAndView addbook(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		try
		{
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			String author = request.getParameter("author");
			String publishedon = request.getParameter("publishedon");
			String discription = request.getParameter("discription");
			String dept = request.getParameter("dept");
			
			Books book = new Books();
			book.setName(name);
			book.setImage(url);
			book.setAuthor(author);
			book.setPublished_date(publishedon);
			book.setDescription(discription);
			book.setDept(dept);
		    
		    msg = librarianService.addbook(book);
		    
		    mv.setViewName("addbookmsg");
		    mv.addObject("message", msg);
		}
		catch(Exception e)
		{
			msg = e.getMessage();
			
			mv.setViewName("addbookmsg");
			mv.addObject("message", msg);
		}
		
		return mv;
	}
	
//	@PostMapping("addbook")
//	public ModelAndView addbook(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException, SerialException, SQLException
//	{
//		ModelAndView mv = new ModelAndView();
//		String msg = null;
//		
//		try
//		{
//			String name = request.getParameter("name");
//			String url = request.getParameter("url");
//			String author = request.getParameter("author");
//			String publishedon = request.getParameter("publishedon");
//			String discription = request.getParameter("discription");
//			String dept = request.getParameter("dept");
//
//			byte[] bytes = file.getBytes();
//			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
//			
//			Books book = new Books();
//			book.setName(name);
//			book.setImage(url);
//			book.setAuthor(author);
//			book.setPublished_date(publishedon);
//			book.setDescription(discription);
//			book.setDept(dept);
//			book.setBookfile(blob);
//		    
//		    msg = librarianService.addbook(book);
//		    
//		    mv.setViewName("addbookmsg");
//		    mv.addObject("message", msg);
//		}
//		catch(Exception e)
//		{
//			msg = e.getMessage();
//			
//			mv.setViewName("addbookmsg");
//			mv.addObject("message", msg);
//		}
//		
//		return mv;
//	}
	
	@PostMapping("adduserwithbook")
	public ModelAndView adduserwithbook(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String msg = null;
		String viewname = null;
		try
		{
			int bid = Integer.parseInt(request.getParameter("bid"));
			Books book = librarianService.viewbookbyid(bid);
			String bname = request.getParameter("bname");
			
			int uid = Integer.parseInt(request.getParameter("uid"));
			User user = librarianService.viewuserbyid(uid);
			String uname = user.getName();
			
			String takendate = request.getParameter("takendate");
			int noofcopies = Integer.parseInt(request.getParameter("noofcopies"));
			
			BookAndUser bookAndUser = new BookAndUser();
			
			bookAndUser.setBook(book);
			bookAndUser.setBname(bname);
			bookAndUser.setUser(user);
			bookAndUser.setUname(uname);
			bookAndUser.setNoofcopies(noofcopies);
			bookAndUser.setTakendate(takendate);
			
//			String tdate=""+takendate.charAt(takendate.length()-2)+takendate.charAt(takendate.length()-1);
//			String tmnth=""+takendate.charAt(takendate.length()-5)+takendate.charAt(takendate.length()-4);
//			String tyear=""+takendate.charAt(takendate.length()-10)+takendate.charAt(takendate.length()-9)+takendate.charAt(takendate.length()-8)+takendate.charAt(takendate.length()-7);	
//			
//			int td=Integer.parseInt(tdate);
//			int tm=Integer.parseInt(tmnth);
//			int ty=Integer.parseInt(tyear);
			
			LocalDate date = LocalDate.parse(takendate);

			LocalDate date2 = date.plusDays(15);
			
			String duedate = ""+date2;
			
			bookAndUser.setDuedate(duedate);
			
			msg = librarianService.addBookAndUser(bookAndUser);
			
			mv.setViewName("addbookandusermsg");
			
			viewname = "viewbook?id="+book.getId();
			
		    mv.addObject("message", msg);
		    mv.addObject("viewname", viewname);
		    
		    String emailmsg1="Taken a Book";
			String emailmsg2="You had taken "+noofcopies+" no of copies of "+bname+" book on "+ takendate + " and the due date is "+duedate;
			
			emailService.sendEmail(user.getEmail(), emailmsg1, emailmsg2);
		}
		catch(Exception e)
		{
			msg = e.getMessage();
			
			mv.setViewName("addbookandusermsg");
			mv.addObject("message", msg);
			mv.addObject("viewname", "libhome");
		}
		
		return mv;
	}
	
	@PostMapping("checkliblogin")
	public ModelAndView checkliblogin(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		Librarian lib = librarianService.checkliblogin(email, pwd);
		
		ModelAndView mv = new ModelAndView();
		
		if(lib!=null)
		{
			
			//session
			
			HttpSession session = request.getSession();
			
			session.setAttribute("lib", lib); // eid is a session variable
			
			//session
			
			mv.setViewName("libhome");
		}
		else
		{
			mv.setViewName("libSignInAndRegistration");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("updatenoofcopies")
	public ModelAndView updatenoofcopies(@RequestParam("id") int id)
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("updatenoofcopies");
	    BookAndUser bu = librarianService.viewbookanduserbyid(id);
	    mv.addObject("bu", bu);
	    return mv;
	}
	
	@PostMapping("updatecopies")
	public ModelAndView updatecopies(HttpServletRequest request)
	{
		String msg=null;
		ModelAndView mv = new ModelAndView();
		int id=Integer.parseInt(request.getParameter("id"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int noofcopies = Integer.parseInt(request.getParameter("noofcopies"));
		int n=librarianService.updatecopies(id, noofcopies);
		if(n>0)
		{
			msg="Updated Successfully";
		    mv.setViewName("viewallcsebooks");
		    List<Books> bookslist = librarianService.viewallcsebooks();
		    mv.addObject("csebooks", bookslist);
		    mv.addObject("msg", msg);
		}
		else
		{
			msg="Updated Failed";
			mv.setViewName("viewallcsebooks");
		    List<Books> bookslist = librarianService.viewallcsebooks();
		    mv.addObject("csebooks", bookslist);
		    mv.addObject("msg", msg);
		}
	    return mv;
	}
	
	@GetMapping("deletebookwithuser")
    public ModelAndView deletebookwithuser(@RequestParam("id") int id)
    {
		librarianService.updatebookanduser(id, null, null);
      String str = librarianService.deletebookwithuser(id);
      ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewallcsebooks");
	    
	    List<Books> bookslist = librarianService.viewallcsebooks();
	    mv.addObject("csebooks", bookslist);	
	    
	    return mv;
    }
	
	@GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request)
    {
		ModelAndView mv = new ModelAndView();
		
	    
		HttpSession session = request.getSession();
	    session.invalidate();
	    mv.setViewName("libSignInAndRegistration");
	    return mv;
    }
	
	//Admin
	

	@GetMapping("addLibrarianAdmin") 
	public ModelAndView addLibrarianAdmin()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("addLibrarianAdmin");
	    return mv;
	}
	
	@GetMapping("addBookAdmin") 
	public ModelAndView addBookAdmin()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("addBookAdmin");
	    return mv;
	}
	
	@PostMapping("addlibadmin")
	public ModelAndView addLibAdmin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		try
		{
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String contact = request.getParameter("contact");
			
			Librarian lib = new Librarian();
			lib.setName(name);
			lib.setGender(gender);
			lib.setDateofbirth(dob);
			lib.setEmail(email);
			lib.setPassword(pwd);
			lib.setContact(contact);
			lib.setActive(true);
		    
		    msg = librarianService.addLibrarian(lib);
		    
		    mv.setViewName("adminLibrarian");
		    List<Librarian> liblist=adminService.viewalllibrarian();
//			  System.out.println(liblist);
			  mv.addObject("libdata",liblist);
		   // mv.addObject("message", msg);
		}
		catch(Exception e)
		{
			msg = e.getMessage();
			
			mv.setViewName("displayerror");
			mv.addObject("message", msg);
		}
		
		return mv;
	}
	
	@PostMapping("addbookAdmin")
	public ModelAndView addbookAdmin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String msg = null;
		
		try
		{
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			String author = request.getParameter("author");
			String publishedon = request.getParameter("publishedon");
			String discription = request.getParameter("discription");
			String dept = request.getParameter("dept");
			
			Books book = new Books();
			book.setName(name);
			book.setImage(url);
			book.setAuthor(author);
			book.setPublished_date(publishedon);
			book.setDescription(discription);
			book.setDept(dept);
		    
		    msg = librarianService.addbook(book);
		    
		    mv.setViewName("adminBook");
		    List<Books> booklist=adminService.viewallbooks();
//			  System.out.println(liblist);
			  mv.addObject("bookdata",booklist);
		   // mv.addObject("message", msg);
		}
		catch(Exception e)
		{
			msg = e.getMessage();
			
			mv.setViewName("addbookmsg");
			mv.addObject("message", msg);
		}
		
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	  public ModelAndView checkadminlogin(HttpServletRequest request)
	  {
	    String uname=request.getParameter("email");
	    String pwd=request.getParameter("pwd");
	    
	    System.out.println(uname+" "+pwd);
	    
	    System.out.println(adminService.checkadminlogin(uname, pwd));
	    Admin a = adminService.checkadminlogin(uname, pwd);
	    
	    ModelAndView mv = new ModelAndView();
    	System.out.println("jhgfds");


	    if(a!=null)
	    {
	    	System.out.println("jhgfdszasxdfgnhbgvfcdxzxcvfbgn");
	    	mv.setViewName("adminhome");
	    	long libcnt=adminService.librariancnt();
	    	long usercnt=adminService.usercnt();
	    	long bookcnt=adminService.bookcnt();
	        //ModelAndView mv = new ModelAndView();
	    	mv.addObject("libcnt", libcnt);
	        mv.addObject("usercnt", usercnt);
	        mv.addObject("bookcnt", bookcnt);
	        System.out.println(libcnt);
	    }
	    else
	    {
	    	System.out.println("abcsdddksj");
	      mv.setViewName("adminlogin");
	      mv.addObject("message","Login Failed");
	    }
	    return mv;
	  }
	
	@GetMapping("adminhome") 
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
    	long libcnt=adminService.librariancnt();
    	long usercnt=adminService.usercnt();
    	long bookcnt=adminService.bookcnt();
        //ModelAndView mv = new ModelAndView();
    	mv.addObject("libcnt", libcnt);
        mv.addObject("usercnt", usercnt);
        mv.addObject("bookcnt", bookcnt);
        System.out.println(libcnt);
	    return mv;
	}
	
	@GetMapping("adminLibrarian") 
	public ModelAndView adminLibrarian()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminLibrarian");
	    return mv;
	}
	
	@GetMapping("adminUser") 
	public ModelAndView adminUser()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminUser");
	    
	    
	    List<User> userlist = librarianService.viewallusers();
	    mv.addObject("users", userlist);	
	    
	    return mv;
	}
	
	@GetMapping("adminlogin") 
	public ModelAndView adminLogin()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminlogin");
	    return mv;
	}
	
	@GetMapping("viewalllibs")
	  public ModelAndView viewallemps()
	  {
		  ModelAndView mv=new ModelAndView();
		  mv.setViewName("adminLibrarian");
		  
		  List<Librarian> liblist=adminService.viewalllibrarian();
//		  System.out.println(liblist);
		  mv.addObject("libdata",liblist);
		  
		  return mv;
	  }
	@GetMapping("viewallbooks")
	  public ModelAndView viewallbooks()
	  {
		  ModelAndView mv=new ModelAndView();
		  mv.setViewName("adminBook");
		  
		  List<Books> bookdata=adminService.viewallbooks();
//		  System.out.println(liblist);
		  mv.addObject("bookdata",bookdata);
		  
		  return mv;
	  }
	  @GetMapping("viewlibadmin")
	  public ModelAndView viewlibdemo(@RequestParam("id") int lid)
	  {
	    Librarian lib = adminService.viewlibrarianbyid(lid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewlibbyid");
	    mv.addObject("lib", lib);
//	    System.out.println(lib.getContact());
	    return mv;
	  }
	  
	  @GetMapping("viewbookadmin")
	  public ModelAndView viewbookadmin(@RequestParam("id") int bid)
	  {
	    Books book = adminService.viewbookbyid(bid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminviewbookbyid");
	    mv.addObject("book", book);
//	    System.out.println(lib.getContact());
	    return mv;
	  }
	  
	  @GetMapping("deletelibadmin")
	  public ModelAndView deletelibdemo(@RequestParam("id") int lid)
	  {
	    String str = adminService.deletelibrarian(lid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminLibrarian");
	    List<Librarian> liblist=adminService.viewalllibrarian();
//		  System.out.println(liblist);
		  mv.addObject("libdata",liblist);
		  
	    mv.addObject("message", str);
//	    System.out.println(lib.getContact());
	    return mv;
	  }
	  @GetMapping("deletebookadmin")
	  public ModelAndView deletebookadmindemo(@RequestParam("id") int bid)
	  {
//		  librarianService.updatebookanduser(bid, null, null);
	    String str = adminService.deletebook(bid);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminBook");
	    List<Books> booklist=adminService.viewallbooks();
//		  System.out.println(liblist);
		  mv.addObject("bookdata",booklist);
		  
	    mv.addObject("message", str);
//	    System.out.println(lib.getContact());
	    return mv;
	  }
	  
	  // user
	  
	  @GetMapping("userregistration") 
		public ModelAndView userregistration()
		{
			ModelAndView mv = new ModelAndView();
		    mv.setViewName("userregistration");
		    return mv;
		}
		
		@GetMapping("userlogin") //URI & method name can be different
		public ModelAndView userlogin()
		{
			ModelAndView mv = new ModelAndView();
		    mv.setViewName("userSignInAndRegistration");
		    return mv;
		}
		@PostMapping("insertuser")
		public ModelAndView insertactionuser(HttpServletRequest request)
		{
			ModelAndView mv = new ModelAndView();
			String msg = null;
			try
			{
				String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String dob = request.getParameter("dob");
				String email = request.getParameter("email");
				String pwd = request.getParameter("pwd");
				String contact = request.getParameter("contact");
				boolean status=true;
			User u=new User();
			u.setName(name);
			u.setGender(gender);
			u.setDateofbirth(dob);
			u.setEmail(email);
			u.setPassword(pwd);
			u.setContact(contact);
			u.setActive(true);	
			
			msg=userService.addUser(u);
			    mv.setViewName("displaymsg");
			    mv.addObject("message", msg);
			}
			catch(Exception e)
			{
				msg = e.getMessage();
				mv.setViewName("displayerror");
				mv.addObject("message", msg);
			}
			return mv;
		}
			
			@PostMapping("checkuserlogin")
			public ModelAndView checkuserlogin(HttpServletRequest request)
			{
				String email = request.getParameter("email");
				String pwd = request.getParameter("pwd");
				
				User u=userService.checkuserlogin(email, pwd);
				
				ModelAndView mv = new ModelAndView();
				
				if(u!=null)
				{
					
					//session
					
					HttpSession session = request.getSession();
					
					session.setAttribute("uid", u.getId()); // eid is a session variable
					session.setAttribute("uname", u.getName()); // ename is a session variable 
					
					//session
					
					mv.setViewName("userhome1");
				}
				else
				{
					mv.setViewName("userSignInAndRegistration");
					mv.addObject("message", "Login Failed");
				}
				return mv;
			}		
			
			@GetMapping("userhome")
			 public ModelAndView userhome()
			  {
			    ModelAndView mv = new ModelAndView();
			      mv.setViewName("userhome1");
			      return mv;
			  }
			
			@GetMapping("uviewallbooks")
			   public ModelAndView uviewallprodsdemo()
			   {
				   List<Books> booklist =  userService.ViewAllBooks();
				   
				   ModelAndView mv = new ModelAndView("userviewallbooks");
				   
				   mv.addObject("booklist", booklist);
				   
				   return mv;
			   }
			 
			  @PostMapping("update")
			  public ModelAndView updateaction(HttpServletRequest request)
			  {
			    String msg = null;
			    ModelAndView mv = new ModelAndView();
				   int id=Integer.parseInt(request.getParameter("id")	);
			     String name = request.getParameter("name");
			     String gender=request.getParameter("gender");
			     String dob = request.getParameter("dob");
			     String dept = request.getParameter("dept");
			     String email = request.getParameter("email");
			     String contact = request.getParameter("contact");
			     String pwd = request.getParameter("pwd");
			     
			     
			    User u=new User();
			    u.setId(id);
			    u.setName(name);
			    u.setGender(gender);
			    u.setDateofbirth(dob);
			    u.setEmail(email);
	 		    u.setContact(contact);
	 		    u.setPassword(pwd);
			   
			      
			      int n = userService.updateUser(u);
			      if(n>0)
			      {
			      mv.setViewName("userhome1");
			      mv.addObject("message",msg);
			      }
			      else
			      {
			     mv.setViewName("userupdateerror");
			      mv.addObject("message",msg);
			      }
			    return mv;
			  }
			  
			  @GetMapping("updateprofile")
			  public ModelAndView updateprofile(@RequestParam("id") int id)
			  {
			    ModelAndView mv = new ModelAndView();
			    User u = userService.viewUserbyid(id);
			    mv.setViewName("userupdateprofile");
			    mv.addObject("usr", u);
			    return mv;
			  }
			  
			  @GetMapping("uviewbook")
			  public ModelAndView uviewempdemo(@RequestParam("id") int bid)
			  {
			    Books book = userService.viewbookbyid(bid);
			      ModelAndView mv = new ModelAndView();
			      mv.setViewName("userviewbookbyid");
			      mv.addObject("book", book);
			      return mv;
			  }
			  
			  @GetMapping("viewprofile")
		      public ModelAndView viewprofile(HttpServletRequest request)
		      {
		        
		        ModelAndView mv = new ModelAndView();        
		        HttpSession session = request.getSession();
		        mv.setViewName("userviewprofile");
		        int id=(int) session.getAttribute("uid");
		        User u = userService.viewUserbyid(id);
		        mv.addObject("uid", session.getAttribute("uid"));
		        mv.addObject("user", u);
		        return mv;
		      }
			  @GetMapping("contentcreater")
			  public ModelAndView viewCCPage(HttpServletRequest request) {
			      ModelAndView mv = new ModelAndView();        
			      HttpSession session = request.getSession();
			      mv.setViewName("cchome"); 
			      return mv;
			  }
			  @GetMapping("studentview")
			  public ModelAndView viewStudentPage(HttpServletRequest request) {
			      ModelAndView mv = new ModelAndView();        
			      HttpSession session = request.getSession();
			      mv.setViewName("studentShowcase"); 
			      return mv;
			  }
			  @GetMapping("viewallcsebooks")
			  public ModelAndView viewallbook(HttpServletRequest request) {
				  ModelAndView mv = new ModelAndView();        
				  HttpSession session = request.getSession();
				  mv.setViewName("studentShowcase"); 
				  return mv;
			  }
			  
//			    // Display the assignment form
//			    @GetMapping("/assignments")
//			    public String showAssignmentForm(Model model) {
//			        model.addAttribute("assignment", new Assignment());
//			        return "addAssignment";  // Renders the 'addAssignment.jsp' form
//			    }
//
//			    // Handle posting the new assignment with PDF file
//			    @PostMapping("/addAssignment")
//			    public String postAssignment(@ModelAttribute Assignment assignment,
//			                                 @RequestParam("pdfAssignment") MultipartFile pdfAssignment) {
//			        try {
//			            // Check if the file is empty
//			            if (pdfAssignment.isEmpty()) {
//			                // You can add a custom error message here
//			                return "redirect:/addAssignment?error=fileEmpty"; // Redirect with an error flag
//			            }
//
//			            // Convert MultipartFile to byte[]
//			            byte[] pdfBytes = pdfAssignment.getBytes();
//			            
//			            // Set the PDF data to the assignment
//			            assignment.setPdfAssignment(pdfBytes);
//
//			            // Save the assignment (including the PDF)
//			            assignmentService.saveAssignment(assignment);
//
//			        } catch (Exception e) {
//			            // Log the error properly (using a logger would be better)
//			            e.printStackTrace();
//			            return "error";  // Return an error page in case of issues
//			        }
//
//			        // Redirect to the assignment list page
//			        return "redirect:/assignments"; 
//			    }
}