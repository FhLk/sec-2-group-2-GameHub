package sit.int202.classicmodelweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodelweb.Repositories.OfficeRepository;

import java.io.IOException;

@WebServlet(name = "OfficeListServlet", value = "/office-list")
public class OfficeListServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            OfficeRepository officeRepository = new OfficeRepository();
            request.setAttribute("offices", officeRepository.findAll());
            String officeCode = request.getParameter("officeCode");
            if (officeCode != null) {
                request.setAttribute("selectedOffice", officeRepository.find(officeCode));
            }
            getServletContext().getRequestDispatcher("/OfficeEmployeeList.jsp").forward(request, response);
        }
        //ของอาจารย์
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        OfficeRepository officeRepository = new OfficeRepository();
//        request.setAttribute("offices", officeRepository.findAll());
//        String officeCode = request.getParameter("officeCode");
//        if (officeCode != null) {
//            request.setAttribute("selectedOffice", officeRepository.find(officeCode));
//        }
//        getServletContext().getRequestDispatcher("/OfficeEmployeeList.jsp").forward(request, response);
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
