package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("메시지 잘받았어 클라이언트야");
		String a = req.getParameter("msg");
		System.out.println(a);
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트의 웹브라우저에 문자열을 출력할수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"utf-8\">");
		pw.println("<title>안뇽</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메시지 잘받았어 클라이언트야</p>");
		pw.println("<p>"+a+"</p>");
		pw.println("<br>");
		pw.println("<img src='/Hello/images/kim1.png'>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.flush();//방출
		pw.close();//닫아주기 (auto flush)
		
	}

}
