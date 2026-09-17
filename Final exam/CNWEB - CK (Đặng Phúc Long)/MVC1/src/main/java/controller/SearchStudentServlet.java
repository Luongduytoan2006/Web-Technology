package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.*;
import model.bo.*;
/**
 * Servlet implementation class SearchStudentServlet
 */
@WebServlet("/search")
public class SearchStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentBo studentBo =  new StudentBo();
    private KhoaBo khoaBo = new KhoaBo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("username") != null) {		
			String value = request.getParameter("value");
			List<Student> students = studentBo.getAllStudent();
			List<Khoa> khoas = khoaBo.getAllKhoa();
			request.setAttribute("khoas", khoas);
			if (!value.equals("all")) {
				students = studentBo.findStudentByKhoa(value);
			}
			request.setAttribute("khoas", khoas);
			request.setAttribute("value", value);
			request.setAttribute("students",students);
			RequestDispatcher dispatcher = request.getRequestDispatcher("StudentList.jsp");
	        dispatcher.forward(request, response);
		} else {
			response.sendRedirect("Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
