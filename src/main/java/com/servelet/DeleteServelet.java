package com.servelet;

import java.io.IOException;

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

/**
 * Servlet implementation class DeleteServelet
 */
public class DeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       public DeleteServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
try {
			
			int note_id=Integer.parseInt(request.getParameter("n_id".trim()));
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("java");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			et.begin();
			Note note=(Note)em.find(Note.class, note_id);
			em.remove(note);
			et.commit();
			
			RequestDispatcher rd=request.getRequestDispatcher("All_notes.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			
		}

	}

}
