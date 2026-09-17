package controller;

import java.io.IOException;
import java.util.List;

import model.bean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bo.*;
/**
 * Servlet implementation class UpdateStudentServlet
 */
@WebServlet("/update")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentBo studentBo = new StudentBo();
    private KhoaBo khoaBo = new KhoaBo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("username") != null) {
			List<Khoa> khoas = khoaBo.getAllKhoa();
			request.setAttribute("khoas", khoas);
			String mssv = request.getParameter("mssv");
			Student student = studentBo.getStudentById(mssv);
			request.setAttribute("student",student);
			RequestDispatcher dispatcher = request.getRequestDispatcher("FormUpdate.jsp");
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
			String hovaten = request.getParameter("hovaten");
			String khoa = request.getParameter("khoa");
			boolean gioitinh = (request.getParameter("gioitinh").equals("Nam")?true:false);
			studentBo.updateStudent(new Student(mssv,hovaten,gioitinh,khoa));
			response.sendRedirect("search?value=all");
		} else {
			response.sendRedirect("Login.jsp");
		}
	}

}
