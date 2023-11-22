<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 


<%
	
  	try{  
	     
  		ServletOutputStream kk=response.getOutputStream();
		int id = Integer.parseInt(request.getParameter("id"));
		
		Statement st=connection.createStatement();
    	String strQuery = "select image from topics where id="+id+" ";
    	ResultSet rs = st.executeQuery(strQuery);
    	String imgLen="";
    	if(rs.next())
		{
      		imgLen = rs.getString(1);
     	}  
		
    	rs = st.executeQuery(strQuery);
    	if(rs.next())
		{
      		int len = imgLen.length();
		  	byte [] rb = new byte[len];
		  	InputStream readImg = rs.getBinaryStream(1);
		 	int index=readImg.read(rb, 0, len);  
		  	st.close();
		   
		kk .write(rb,0,len); 
		  	response.getOutputStream().flush();     
		  	kk.close();
		}
		
		
		
		
			
			
		
		
  	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>

</body>
</html>