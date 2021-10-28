package sit.int202.courseregister.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.courseregister.models.CourseRepository;
import sit.int202.courseregister.models.Semester;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CourseListServlet", value = "/course-list")
public class CourseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("semesters", Semester.getAllSemesterText());
        getServletContext().getRequestDispatcher("/CourseList.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> parameterMap = request.getParameterMap();request.setCharacterEncoding("UTF-8");
        if (parameterMap.get("semester") == null)
        {doGet(request, response);
            return;}
        int semester = Integer.valueOf(parameterMap.get("semester")[0]);
        request.setAttribute("semesters", Semester.getAllSemesterText());//variable1>>array,control in Course-list
        request.setAttribute("selectedSemester", semester);//variable2>>ตัวแปรเดี่ยว,control in Course-list
        request.setAttribute("subjects", CourseRepository.getSubjects(semester));//variable3>>เป็นList
        getServletContext().getRequestDispatcher("/CourseList.jsp").forward(request, response);
    }
    }

