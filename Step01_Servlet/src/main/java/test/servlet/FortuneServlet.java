package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	/*
	 * FortuneServlet 객체가 언제 생성이 되지?
	 * 생성이 된다면 여러개가 생성이 될까?
	 * 아니면 하나만 생성해서 사용이 될까?
	 */
	
	public FortuneServlet() {
		//최초 요청시 객체가 생성이 되고 그 이후에는 생성된 객체를 다시 사용한다.
		System.out.println("FortunServlet 객체 생성됨!");
	}
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//응답 인코딩 설정
		req.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		
		Random ran = new Random();
		int ranNum = ran.nextInt(5);
		String[] ft = new String[5];
		ft[0]= "아주 좋네요";
		ft[1]= "별로에요";
		ft[2]= "뒤통수 조심하세요";
		ft[3]= "복권 사세요";
		ft[4]= "그냥 집에 있으세요";
		String ranft = ft[ranNum];
		
		PrintWriter pw=resp.getWriter();
		  pw.println("<!doctype html>");
	      pw.println("<html>");
	      pw.println("<head>");
	      pw.println("<meta charset='utf-8'>");
	      pw.println("<title>운세입니다.</title>");
	      pw.println("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" />");
	      pw.println("</head>");
	      pw.println("<body>");
	      pw.println("<p class=\"alert alert-primary\">오늘의 운세: "+ranft+"</p>");
	      pw.println("<br>");
	      pw.println("<a href=\"/Step01_Servlet/index.html\">홈으로</a>");
	      pw.println("</body>");
	      pw.println("</html>");
	      //pw.flush();//방출 
	      pw.close();//닫아주기만해도 auto flush가 된다.
	      
		
	}
	
	
	

}
