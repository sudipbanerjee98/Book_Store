<html>
<head>
    <title>Bookstore - Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #4CAF50, #2E8B57);
        }

        .container {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            width: 300px;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
        }

        a {
            text-decoration: none;
        }

        button {
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 10px 0;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background: #45a049;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome to Bookstore</h1>
    <a href="register.jsp"><button>Signup</button></a>
    <a href="login.jsp"><button>Login</button></a>
</div>

</body>
</html>
