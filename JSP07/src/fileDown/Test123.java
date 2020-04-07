package fileDown;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Servlet implementation class Test123
 */
@WebServlet("/Test123.do")
public class Test123 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Test123() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 방식으로 연동되었습니다");
		response.sendRedirect("fileForm.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 방식으로 연동되었습니다");
		response.sendRedirect("fileForm.jsp");
	}

}
