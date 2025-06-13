<!DOCTYPE html>
<html lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $text_check_pay; ?></title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        .loader {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="loader"></div>
    <div class="message"><?php echo $text_check_pay; ?></div>

    <script>
        let attemptCount = 0;
        const maxAttempts = 5;
        const checkUrl = "<?php echo str_replace('&amp;', '&', $query_url); ?>";

        function checkStatus() {
            attemptCount++;

            fetch(checkUrl)
                .then(response => response.json())
                .then(data => {
					console.log(data.status);
					
                    if (data.status === true) {
                        window.location.href = "<?php echo $redirect_success; ?>";
                    } else if (data.status === false || attemptCount >= maxAttempts) {
                        window.location.href = "<?php echo $redirect_fail; ?>";
                    }
                })
                .catch(error => {
                    console.error("Помилка запиту:", error);
                    if (attemptCount >= maxAttempts) {
                        window.location.href = "<?php echo $redirect_fail; ?>";
                    }
                });

            if (attemptCount < maxAttempts) {
                setTimeout(checkStatus, 3000);
            }
        }

        checkStatus();
    </script>
</body>
</html>