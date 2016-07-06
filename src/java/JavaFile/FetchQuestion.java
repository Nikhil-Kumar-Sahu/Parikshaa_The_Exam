/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaFile;

import JavaFile.Jconnect;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class FetchQuestion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try{
            Connection con = Jconnect.connect();
            PreparedStatement ps;
            ResultSet rs;
            
            int qno = Integer.parseInt(request.getParameter("qno"));
            int answer = Integer.parseInt(request.getParameter("answer"));
            
            
            // First Question
            if(qno == 0 && answer == -1)
            {
                ps = con.prepareStatement("select * from quant where qno = ?");
                ps.setInt(1,(qno+1));
                rs = ps.executeQuery();
                if(rs.next())
                {
                String data = rs.getString("question")+"|||"+rs.getString("option1")+"|||"+rs.getString("option2")+"|||"+rs.getString("option3")+
                        "|||"+rs.getString("option4");
                
                out.print(data);
                rs.close();
                }
            }
            // Navigation Request
            else if (answer == 100)
            {
                
                ps = con.prepareStatement("select * from quant where qno = ?");
                ps.setInt(1,qno);
                ResultSet nrs = ps.executeQuery();
                
                ps= con.prepareStatement("select * from student_answer where qno = ?");
                ps.setInt(1,qno);
                ResultSet nrs1 = ps.executeQuery();
                
                if(nrs.next()&&nrs1.next())
                {
                    
                    
                String data = nrs.getString("question")+"|||"+nrs.getString("option1")+"|||"+nrs.getString("option2")+"|||"+nrs.getString("option3")+
                        "|||"+nrs.getString("option4")+"|||"+nrs1.getString("s_answer");

                    out.print(data);
                   /* String Json = "'{\"question\":\""+question+"\",\"o1\":\""+option1+"\",\"o2\":\""+option2+"\",\"o3\":\""+option3+"\",\"o4\":\""+option4+"\",\"check_answer\":\""+checked_answer+"\"}'" ;
                    out.print(Json);*/
                }
                
            }
            //Question Skipped
            else if (answer == 0)
            {
                    ps = con.prepareStatement("update student_answer set marks = 0 where qno = ?");
                    ps.setInt(1, qno);
                    ps.executeUpdate();
                    ps.execute("commit");   

                    ps = con.prepareStatement("update student_answer set s_answer = 0 where qno = ?");
                    ps.setInt(1,qno);
                    ps.executeUpdate();
                    ps.execute("commit");   
                   
                
                
                ps = con.prepareStatement("select * from quant where qno = ?");
                ps.setInt(1,(qno+1));
                rs = ps.executeQuery();
                
                PreparedStatement psa = con.prepareStatement("select s_answer from student_answer where qno = ?");
                psa.setInt(1,(qno+1));
                ResultSet rsa = psa.executeQuery();

                
                if(rs.next()&&rsa.next())
                {
                String data = rs.getString("question")+"|||"+rs.getString("option1")+"|||"+rs.getString("option2")+"|||"+rs.getString("option3")+
                        "|||"+rs.getString("option4")+"|||"+rsa.getString("s_answer");
                    
                  
                
                out.print(data);
                }
                rs.close();

                
                
            }
            // Question atempted. Match the answer, update the marks and fetch next question 
            else
            {
                PreparedStatement ps1 = con.prepareStatement("update student_answer set s_answer = ? where qno = ?");
                ps1.setInt(1,answer);
                ps1.setInt(2,qno);
                ps1.executeUpdate();
                ps1.execute("commit");
                
                int right_answer;
                ps = con.prepareStatement("select answer from quant where qno = ?");
                ps.setInt(1,qno);
                rs = ps.executeQuery();
                
                rs.next();
                right_answer = Integer.parseInt(rs.getString("answer"));
                
                if(right_answer == answer)
                {
                    ps = con.prepareStatement("update student_answer set marks = 3 where qno = ?");
                    ps.setInt(1, qno);
                    ps.executeUpdate();
                    ps.execute("commit");   
                    
                    
                    
                }
                else
                {
                    ps = con.prepareStatement("update student_answer set marks = -1 where qno = ?");
                    ps.setInt(1, qno);
                    ps.executeUpdate();
                    ps.execute("commit");
                }
                
                
                // Fetch Next Question
                
                ps = con.prepareStatement("select * from quant where qno = ?");
                ps.setInt(1,(qno+1));
                rs = ps.executeQuery();
                
                PreparedStatement psa = con.prepareStatement("select s_answer from student_answer where qno = ?");
                psa.setInt(1,qno+1);
                ResultSet rsa = psa.executeQuery();
                if(rs.next()&&rsa.next())
                {
                    
                    
                String data = rs.getString("question")+"|||"+rs.getString("option1")+"|||"+rs.getString("option2")+"|||"+rs.getString("option3")+
                        "|||"+rs.getString("option4")+"|||"+rsa.getString("s_answer");
                
                out.print(data);
                }
                
                rs.close();
                
            
            }
            
            
            
            } catch(Exception e){
              out.print(e);
               
                        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
