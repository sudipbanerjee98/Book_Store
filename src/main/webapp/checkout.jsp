<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout - Bookstore</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #FF6F61, #FFD194); /* Coral to soft gold */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: #006D77; /* Deep teal */
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,0.15);
        }

        header h1 {
            margin: 0;
            color: #FFECD1; /* Cream */
            font-size: 2rem;
            letter-spacing: 1px;
        }

        nav {
            margin-top: 10px;
        }

        nav a {
            color: #FFECD1;
            text-decoration: none;
            margin: 0 12px;
            font-weight: bold;
            padding: 8px 14px;
            border-radius: 8px;
            transition: background 0.3s, transform 0.2s;
        }

        nav a:hover {
            background: #E29578; /* Warm clay */
            transform: translateY(-2px);
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .message {
            background: #FFECD1; /* Cream */
            color: #006D77; /* Deep teal */
            padding: 18px 26px;
            border-radius: 10px;
            font-weight: bold;
            font-size: 1.1rem;
            box-shadow: 0 6px 14px rgba(0,0,0,0.15);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: scale(0.95);}
            to {opacity: 1; transform: scale(1);}
        }
    </style>
</head>
<body>

<header>
    <h1>Checkout</h1>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="books">Books</a>
        <a href="cart.jsp">Cart</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<main>
    <div class="message">
        ${message}
    </div>
</main>

</body>
</html>
