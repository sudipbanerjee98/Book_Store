<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register - Bookstore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #FF6F61, #8E44AD, #16A085);
            background-size: 400% 400%;
            animation: gradientMove 8s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .register-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 35px 45px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            width: 370px;
            text-align: center;
            backdrop-filter: blur(5px);
        }

        h1 {
            margin-bottom: 25px;
            color: #6A1B9A;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 18px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
            outline: none;
            background: #FAFAFA;
            transition: 0.3s ease;
        }

        input:focus {
            border-color: #FF6F61;
            box-shadow: 0 0 8px rgba(255, 111, 97, 0.5);
            background: #fff;
        }

        input[type="submit"] {
            width: 100%;
            background: linear-gradient(45deg, #FF6F61, #8E44AD);
            color: white;
            border: none;
            padding: 12px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(45deg, #8E44AD, #FF6F61);
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .error {
            color: #E53935;
            margin-top: 10px;
            font-size: 0.9rem;
        }

        p {
            margin-top: 18px;
            font-size: 0.9rem;
        }

        a {
            color: #8E44AD;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
        }

        a:hover {
            color: #FF6F61;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h1>Create Account</h1>
    <form action="register" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
        <input type="submit" value="Register">
    </form>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <p class="error"><%= request.getAttribute("errorMessage") %></p>
    <% } %>

    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>

</body>
</html>
