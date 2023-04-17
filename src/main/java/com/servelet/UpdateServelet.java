package com.servelet;

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notes.Note;

public class UpdateServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServelet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int noteId=Integer.parseInt(request.getParameter("noteID").trim());
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("java");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Note n=(Note)em.find(Note.class, noteId);
			
			n.setTitle(title);
			n.setContent(content);
			n.setDate(new Date());
			
			et.begin();
			em.merge(n);
			et.commit();
			 
			RequestDispatcher rd=request.getRequestDispatcher("All_notes.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {

		}

	}

}
