<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Showcase</title>
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe, #a18cd1);
            background-size: 400% 400%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: bgAnimation 10s infinite;
            overflow: hidden;
        }

        @keyframes bgAnimation {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        /* Moving Shapes */
        .shape {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            animation: moveShapes 10s infinite ease-in-out;
        }

        .shape:nth-child(1) {
            top: 10%;
            left: 15%;
            animation-duration: 12s;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            bottom: 10%;
            right: 10%;
            animation-duration: 15s;
            animation-delay: 3s;
        }

        .shape:nth-child(3) {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation-duration: 20s;
            animation-delay: 6s;
        }

        @keyframes moveShapes {
            0% {
                transform: translateY(0px) scale(1);
            }
            50% {
                transform: translateY(-30px) scale(1.2);
            }
            100% {
                transform: translateY(0px) scale(1);
            }
        }

        /* Showcase Section */
        #student-showcase {
            display: flex;
            gap: 30px;
            justify-content: center;
            align-items: center;
        }

        /* Card Styles */
        .student-card {
            width: 260px;
            height: 380px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.4s, box-shadow 0.4s;
            position: relative;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .student-card:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .student-card:before {
            content: '';
            position: absolute;
            width: 140%;
            height: 140%;
            background: rgba(255, 255, 255, 0.2);
            top: -20%;
            left: -20%;
            transform: rotate(45deg);
            transition: transform 0.5s;
        }

        .student-card:hover:before {
            transform: rotate(0deg);
        }

        /* Individual Styles for Each Student */
        .student-card.roshan {
            color: #ff6f61;
        }

        .student-card.ritesh {
            color: #63cdda;
        }

        .student-card.habibullah {
            color: #8e44ad;
        }

        /* Text Inside the Card */
        .student-info {
            text-align: center;
            z-index: 1;
            color: white;
        }

        .student-info h2 {
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .student-info p {
            font-size: 18px;
            font-weight: 300;
        }
    </style>
</head>
<body>
    <!-- Background Moving Shapes -->
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>

    <section id="student-showcase">
        <div class="student-card roshan">
            <div class="student-info">
                <h2>Roshan</h2>
                <p>ID: 2200030535</p>
            </div>
        </div>

        <div class="student-card ritesh">
            <div class="student-info">
                <h2>Ritesh</h2>
                <p>ID: 2200030320</p>
            </div>
        </div>

        <div class="student-card habibullah">
            <div class="student-info">
                <h2>Habibullah</h2>
                <p>ID: 2200032527</p>
            </div>
        </div>
    </section>
</body>
</html>