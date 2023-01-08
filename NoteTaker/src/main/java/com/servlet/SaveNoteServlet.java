package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.todo.Note;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
		PrintWriter out	=response.getWriter();
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());
			System.out.println(note.getId() + note.getTitle());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			s.save(note);

			tx.commit();
			s.close();
//			response.setContentType("text/html");
//			out.println("<h1 style='text-align:center'>Data Added Successfully</h2>");
//			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View All</a></h2>");
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
