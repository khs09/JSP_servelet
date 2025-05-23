package servlet;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) 
			throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		if (memberName != null) {
			req.setAttribute("autoMessage", memberName + "회원님 방가방가^^*");
		}
		else {
			if (admin_id.equals(id))
				req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
			else
				req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
		}
		req.getRequestDispatcher("/12Servlet/MemberAuth.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}