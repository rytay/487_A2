<%-- 
    Document   : manageloans
    Created on : Apr 4, 2020, 3:04:16 PM
    Author     : xavie
--%>

<%@page import="pkg487.loan.core.Loan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pkg487.webclient.SOAPClient" %>
<%@page import="pkg487.loan.core.User" %>

<%
//Check if User is Admin
if(session == null){
    response.sendRedirect("..");
}else if(null == session.getAttribute("authLevel")){
    response.sendRedirect("..");
}else if(!session.getAttribute("authLevel").equals(0)){
    response.sendRedirect("..");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <!-- Bulma Version 0.8.x-->
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.8.0/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css/admin.css">
</head>

<body>
    
<!-- START NAV -->
    <nav class="navbar is-white">
        <div class="container">
            <div class="navbar-brand">
                <a class="navbar-item brand-text" href="/487-Webclient/admin/home.jsp">
          Library Management System
        </a>
                <div class="navbar-burger burger" data-target="navMenu">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <div id="navMenu" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item" href="/487-Webclient/admin/home.jsp">Home</a>
                    <a class="navbar-item" href="/487-Webclient/admin/managebooks/managebooks.jsp">Manage Books</a>
                    <a class="navbar-item" href="/487-Webclient/admin/manageloans/manageloans.jsp">Manage Loans</a>
                    <a class="navbar-item" href="/487-Webclient/admin/manageusers/manageusers.jsp">Manage Users</a>
                </div>
                <div class="navbar-end">
                    <div class="navbar-item">
                        <form action="/487-Webclient/LogOutServlet" method="POST">
                            <input class="button" type="submit" name="logout" value="logout" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <!-- END NAV -->
        <section class="hero">
            <div clas="hero-body">
                <div class="container">
                    <h1 class="title">Loan Management</h1>
                    <h2 class="subtitle">Edit Loan Info</h2>
                </div>
            </div>
        </section>
        
        <section class="section">
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Loan Id</th>
                            <th>User ID Borrowing</th>
                            <th>Book ID Loaned</th>
                            <th>Date Borrowed</th>
                            <th>Date Returned</th>
                            <th>Edit Loan</th>
                            <th>Delete Loan</th>
                        </tr>
                    </thead>
                    <tbody>                           
                        <%
                            SOAPClient client = new SOAPClient();
                            Loan[] loans = client.listLoans();
                            pageContext.setAttribute("loans", loans);
                        %>
                        
                        <c:forEach items="${loans}" var="loan">
                            <tr>
                                <td>${loan.getId()}</td>
                                <td>${loan.getUserId()}</td>
                                <td>${loan.getBookId()}</td>
                                <td>${loan.getDateBorrowed()}</td>
                                <td>${loan.getDateReturned()}</td>
                                <td>Test</td>
                                <td>Test</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
   </body>
    <script async type="text/javascript" src="../../js/bulma.js"></script>
</html>