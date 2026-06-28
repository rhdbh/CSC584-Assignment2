<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Profiles</title>
    <link href="https://fonts.googleapis.com/css2?family=Tinos&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: Tinos, sans-serif;
            background-image: url("images/background1.jpg");
            background-size: cover;
            margin: 0;
            padding: 30px;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #e5b69f;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        th {
            background: #e5b69f;
            color: white;
        }

        button {
            margin-top: 20px;
            background: #e5b69f;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #b68f70;
        }
    </style>
</head>
 
<body>

<div class="container">
    <h2>All Student Profiles</h2>
    
<form method="get" action="ViewProfilesServlet">
    <input type="text" name="search" placeholder="Search by Name or Student ID">
    <button type="submit">Search</button>
</form>
     
    <table>
        <tr>
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Hobbies</th>
            <th>Introduction</th>
        </tr>

<%
    ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("studentList");

    if (list != null) {
        for (String[] p : list) {
%>
        <tr>
            <td><%= p[0] %></td>
            <td><%= p[1] %></td>
            <td><%= p[2] %></td>
            <td><%= p[3] %></td>
            <td><%= p[4] %></td>
            <td><%= p[5] %></td>
        </tr>
<%
        }
    }
%>

    </table>

<button onclick="window.location.href='index.html'">Back</button>
</div>

    </body>
</html>