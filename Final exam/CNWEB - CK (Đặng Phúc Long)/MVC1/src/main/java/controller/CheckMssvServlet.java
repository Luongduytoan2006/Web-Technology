package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bo.*;
/**
 * Servlet implementation class CheckMssvServlet
 */
@WebServlet("/checkmssv")
public class CheckMssvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StudentBo studentBo = new StudentBo();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMssvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Thiết lập kiểu phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ yêu cầu POST
        String mssv = request.getParameter("mssv");
        boolean isValid = studentBo.checkmssv(mssv);
        PrintWriter out = response.getWriter();
        out.println(mssv + ", " + isValid);
        // Tạo một phản hồi JSON
        String jsonResponse = "{\"message\": " + isValid + "}";

        // Ghi phản hồi về client
        response.getWriter().write(jsonResponse);
	}

}
