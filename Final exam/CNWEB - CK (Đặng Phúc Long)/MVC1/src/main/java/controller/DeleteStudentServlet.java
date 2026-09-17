package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bo.*;
import model.bean.*;
/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/delete")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentBo studentBo = new StudentBo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("username") != null) {
			String mssv = request.getParameter("mssv");
			Student student = studentBo.getStudentById(mssv);
			request.setAttribute("student",student);
			RequestDispatcher dispatcher = request.getRequestDispatcher("FormDelete.jsp");
	        dispatcher.forward(request, response);
		} else {
			response.sendRedirect("Login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("username") != null) {
			String mssv = request.getParameter("mssv");
			studentBo.deleteStudent(mssv);
			response.sendRedirect("search?value=all");
		} else {
			response.sendRedirect("Login.jsp");
		}
	}

}
