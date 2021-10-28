package sit.int202.classicmodelweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.classicmodelweb.Repositories.ProductRepository;
import sit.int202.classicmodelweb.entities.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/product-list")
public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductRepository productRepository = new ProductRepository();
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");
        int page = pageParam == null ? 1 : Integer.valueOf(pageParam);
        int pageSize = pageSizeParam == null ? productRepository.getDefaultPageSize() : Integer.valueOf(pageSizeParam);
        List<Product> productList = productRepository.findAll(page, pageSize);
        request.setAttribute("products", productList);
        request.setAttribute("page", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("itemCount", productRepository.countAll());
        int itemCount= productRepository.countAll();
        int totalPage=itemCount/pageSize+(itemCount%pageSize==0 ? 0:1 );
        request.setAttribute("totalPage",totalPage);
        getServletContext().getRequestDispatcher("/ProductList.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
