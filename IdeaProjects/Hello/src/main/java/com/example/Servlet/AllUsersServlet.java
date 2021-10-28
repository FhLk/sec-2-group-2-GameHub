package com.example.Servlet;

import com.example.hello.User;
import com.example.hello.UsersDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * Created by yotamm on 28/04/16.
 */
@WebServlet("/users")
public class AllUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsersDB usersDB = UsersDB.getInstance();
        Collection<User> users = usersDB.getAllUsers(); //fetch all the users

        //Forward the request to users.jsp to render the list
        req.setAttribute("model", users);
        req.getRequestDispatcher("users.jsp").forward(req, resp);
    }
}

