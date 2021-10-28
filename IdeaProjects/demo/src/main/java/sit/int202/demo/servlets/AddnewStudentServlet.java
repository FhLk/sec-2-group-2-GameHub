package sit.int202.demo.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.demo.models.Student;
import sit.int202.demo.models.StudentRepository;

import java.io.IOException;

import static java.lang.String.valueOf;

@WebServlet(name = "AddnewStudentServlet", value = "/add-new-student")
public class AddnewStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/StudentForm.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String gpax=request.getParameter("gpax");
        if(id.trim().length()==0 || name.trim().length()==0 || gpax.length()==0){
           request.setAttribute("msg","Invalid data!!");
            getServletContext().getRequestDispatcher("/StudentForm.jsp").forward(request,response);
        return;
        }
        Student student =new Student(Integer.valueOf(id),name,Double.valueOf(gpax));//ให้ข้อมูลส่งกลับมา
        StudentRepository studentRepository=new StudentRepository();
        studentRepository.save(student);
        //getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        request.setAttribute("student",student);//ใน" "ตั้งชื่ออะไรก้ได้แต่ต้องให้ตรงกับในjsp อีกอันนึงเป็นobjectที่เราจะส่งไป
        getServletContext().getRequestDispatcher("/StudentInfo.jsp").forward(request,response);
    }
}
