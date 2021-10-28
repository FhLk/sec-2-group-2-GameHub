package sit.int202.demo.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.demo.models.Student;
import sit.int202.demo.models.StudentRepository;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet(name = "StudentListServlet", value = "/student-list")
public class StudentListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentRepository studentRepository = new StudentRepository();//ได้objมา
        Collection<Student> s= studentRepository.all();
        request.setAttribute("students",s);
        getServletContext().getRequestDispatcher("/StudentListing.jsp").forward(request,response);
//        try (PrintWriter out = response.getWriter()) {
//            out.println("<html>");
//            out.println("<body style='padding: 100px'>");
//            out.println("<body BGCOLOR=\"PeachPuff\">"); //เปลี่ยนสีพื้นหลัง
//            out.println("<h1>Student List ::</h1><hr>");
//            out.println("<table>");//สร้างตาราง
//            for (Student student : studentRepository.all()) {
//                out.println("<tr><td>Id: </td> <td>" + student.getId() + "</td></tr>");
//                out.println("<tr><td>Name: </td> <td>" + student.getName() + "</td></tr>");
//                out.println("<tr><td>GPAX: </td> <td>" + student.getGpax() + "</td></tr>");
//                out.println("<tr><td colspan='2'><hr></td></tr>");
//            }//วนลูปทำแบบนี้ทุกคนห
//            out.println("</table>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
