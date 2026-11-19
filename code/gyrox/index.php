<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VG CLUB ADMIN</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #FFD700;
            --primary-dark: #B8860B;
            --text: #fff;
            --bg: #121212;
            --input-bg: rgba(255, 255, 255, 0.1);
            --border: rgba(255, 215, 0, 0.5);
            --error: #ff2a6d;
            --success: #05ffa1;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--bg);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: var(--text);
            text-align: center;
        }

        .login-container {
            background: rgba(0, 0, 0, 0.85);
            padding: 2.5rem;
            border-radius: 15px;
            border: 2px solid var(--border);
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
            width: 350px;
            backdrop-filter: blur(10px);
            transition: all 0.3s ease-in-out;
        }

        .login-container:hover {
            box-shadow: 0 0 30px rgba(255, 215, 0, 0.8);
        }

        .brand-wrapper h2 {
            color: var(--primary);
            font-size: 2rem;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 0 10px var(--primary);
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text);
            font-weight: bold;
            text-transform: uppercase;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border);
            border-radius: 5px;
            font-size: 1rem;
            color: var(--text);
            background: var(--input-bg);
            transition: all 0.3s ease;
            outline: none;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 10px var(--primary);
        }

        .btn-login {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid var(--primary);
            border-radius: 5px;
            background: var(--primary);
            color: #000;
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: var(--primary-dark);
            color: #fff;
            box-shadow: 0 0 15px var(--primary);
        }

        .error-message {
            background: rgba(255, 42, 109, 0.1);
            border: 1px solid var(--error);
            color: var(--error);
            padding: 0.75rem;
            border-radius: 5px;
            margin-top: 1rem;
            font-size: 0.875rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="brand-wrapper">
            <h2>VG CLUB ADMIN</h2>
        </div>
        
        <form action="maulyikarisalu.php" method="post">
            <div class="form-group">
                <label for="username"><i class="fas fa-user"></i> Username</label>
                <input type="text" class="form-control" id="username" name="username" required placeholder="Enter username">
            </div>
            
            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i> Password</label>
                <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
            </div>
            
            <button type="submit" class="btn-login"><i class="fas fa-sign-in-alt"></i> Login</button>
        </form>
    </div>
</body>
</html>
