<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <style>
       body {
            font-family: Tinos, sans-serif;
            background-image: url("images/background1.jpg");
            background-size: cover;     
            background-repeat: no-repeat;
            margin: 0px;
            height: 115vh;               
            display: flex;   
            justify-content: center;    
            align-items: center; 
        }
        .profile {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            width: 700px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #e5b69f;
        }
        p {
            font-size: 20px;
        }
        button {
            font-family: Tinos, sans-serif;
            background: #e5b69f;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #b68f70;
        }        
    </style>
</head>
<body>
    <div class="profile">
        <h2>Student Profile</h2>
        <p><strong>Name:</strong> ${name}</p>
        <p><strong>Student ID:</strong> ${studentId}</p>
        <p><strong>Program:</strong> ${program}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Hobbies:</strong> ${hobbies}</p>
        <p><strong>Introduction:</strong> ${intro}</p>
        <p><button onclick="window.location.href='index.html'">Back</button></p>
    </div>
</body>
</html>
