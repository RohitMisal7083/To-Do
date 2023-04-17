package com.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notes.Note;
public class SaveNoteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaveNoteServelet() {
        super();
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			try {
				
				// title, content fetch
				
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				
				Note note=new Note(title, content, new Date());
				
				System.out.println(note.getId()+"  "+note.getTitle()+ " "+note.getContent());
				
				EntityManagerFactory emf=Persistence.createEntityManagerFactory("java");
				EntityManager em=emf.createEntityManager();
				EntityTransaction et=em.getTransaction();
				
				et.begin();
				em.persist(note);
				et.commit();
				
				PrintWriter pw=response.getWriter();
				pw.println("<h1 style='text-align:center'>Saved Sucsessfully</h1>");
				pw.println("<h1 style='text-align:center'><a href='All_notes.jsp'>View ALL</a></h1>");

				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

}
