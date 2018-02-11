

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<head>
  <meta charset="UTF-8">
  <title>Sign In Form</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  
<div class="container">
  <form method="post" name="signin">
    <div class="row">
      <h4>Account</h4>
      <div class="input-group input-group-icon">
        <input type="email" name="email" placeholder="Email Adress"/>
      </div>
      <div class="input-group input-group-icon">
        <input type="password" name="password" placeholder="Password"/>
      </div>
    </div>

    <div class="row">
      <h4>Terms and Conditions</h4>
      <div class="input-group">
        <input type="checkbox" id="terms"/>
        <label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
      </div>
    </div>
      <input type="submit" class="btn btn-success" name="submit" value="Sign In">
  </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
  <%  try {
      String email=request.getParameter("email");
            String pass1=request.getParameter("password");
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hr","hr");
            int c=0;
            Statement st=con.createStatement();
            String select="select * from CODECHEF where EMAIL_ID='"+email+"' and PASSWORD='"+pass1+"'";
            ResultSet rs=st.executeQuery(select);
            if(rs.next())
            {  
                c++;
                String passon=rs.getString("NAME");
                String email1=rs.getString("EMAIL_ID");
                String gender=rs.getString("GENDER");
               HttpSession ses=request.getSession();
               ses.setAttribute("nm",passon);
               ses.setAttribute("email",email1);
               ses.setAttribute("gender",gender);
                response.sendRedirect("newjsp.jsp");   
            }
            if(c==0) {
  %>
  <script language="javascript">
      alert("Login failed");
  </script>
  <% } 
}
catch(Exception e){
System.out.println(e);
}
  %>
    <script  src="js/index.js"></script>
     



</body>

</html>
