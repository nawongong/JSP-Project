package shopmgr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sp")
public class ShopMgrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopMgrController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
		
		String action = request.getParameter("action");
		PrintWriter writer = response.getWriter(); 
		
		//System.out.println(action);
		
		MemberDAO mdao = new MemberDAO();
		
		HttpSession ses= request.getSession(); //세션객체 가져오기
		
		switch(action) {
			// 회원가입 
			case "register":
				String id = request.getParameter("id");
	        	String pw = request.getParameter("pw");
	        	String pwc = request.getParameter("pwc");
	        	String name = request.getParameter("name");
	        	String email = request.getParameter("email");
	        	String tel = request.getParameter("tel");
	        	String id_chk = request.getParameter("chk_id");
	        	
	        	// 아이디 중복확인 했을 때
	        	if(id_chk.equals("true")) {
	        		// 비밀번호랑 비밀번호 확인이 일치할 때
	        		if(pw.equals(pwc)) {
		        		mdao.insert(id, pw, name, email, tel);
		        		writer.println("<script>alert('회원가입 되었습니다.');location.href='index.jsp';</script>"); 
		        		writer.close();
		        	}else {
		        		writer.println("<script>alert('비밀번호를 확인해주세요.');history.back();</script>"); 
		        		writer.close();
		        	}
	        	}else{
	        		writer.println("<script>alert('아이디를 확인해주세요.');history.back();</script>"); 
	        		writer.close();
	        	}
	        	
	        	
	        	   
	        	
				break;
			// 로그인 했을 때
			case "login":
				String login_id = request.getParameter("id");
				String login_pw = request.getParameter("pw");
				String remember_id = request.getParameter("remember_id_chk");
				
				String result = mdao.loginCheck(login_id, login_pw);
				if(remember_id.equals("true")) {
					ses.setAttribute("id", login_id);
					//System.out.println(remember_id);
				}else {
		        	ses.removeAttribute("id");
				}
				
				if(result.equals("OK")) { //회원맞음
	        		   ses.setAttribute("login", "OK");
	        		   writer.println("<script>alert('로그인 되었습니다.');location.href='index.jsp';</script>");
	        	   }
	        	   else { //회원 아님
	        		   writer.println("<script>alert('아이디 혹은 비밀번호가 틀렸습니다.');history.back();</script>");     		   
	        	   }
				break;
			case "idCheck":
				String register_id = request.getParameter("id");
				PrintWriter out = response.getWriter();
				int re = mdao.checkId(register_id);
				out.write(re + "");
				break;
			case "logout":
				ses.removeAttribute("id");
				ses.removeAttribute("login");
				writer.println("<script>alert('로그아웃 되었습니다.');location.href='index.jsp';</script>");
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
