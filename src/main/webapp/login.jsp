<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - Bookstore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #6A11CB, #FF4B2B); /* deep purple to coral pink */
        }

        .login-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.25);
            width: 320px;
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        h1 {
            margin-bottom: 25px;
            color: #6A11CB;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 16px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1rem;
            outline: none;
            transition: 0.3s;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #FF4B2B;
            box-shadow: 0 0 6px rgba(255, 75, 43, 0.4);
        }

        input[type="submit"] {
            width: 100%;
            background: linear-gradient(90deg, #6A11CB, #FF4B2B);
            color: white;
            border: none;
            padding: 12px;
            font-size: 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: transform 0.3s ease, background 0.3s ease;
        }

        input[type="submit"]:hover {
            transform: scale(1.05);
            background: linear-gradient(90deg, #5A0EBB, #E04323);
        }

        .error {
            color: #E53935;
            margin-top: 10px;
            font-size: 0.9rem;
        }

        p {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        a {
            color: #FF4B2B;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="login-container">
    <h1>Login</h1>
    <form action="login" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</div>

</body>
</html>
