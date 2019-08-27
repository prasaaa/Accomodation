<%-- 
    Document   : signup
    Created on : 15-Aug-2019, 08:54:03
    Author     : Prasad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="SignUp_css/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="SignUp_css/css/style.css">
</head>
<body>

    <div class="main">

        <div class="container">
            <form method="POST" class="appointment-form" id="appointment-form" action="User_INSERT_Controller" method="POST">
                <h2>Student Accomodation System SignUp</h2>
                <div class="form-group-1">
                    <input type="text" name="user_firstName" id="title" placeholder="Enter First Name" required />
                    <input type="text" name="user_lastName" id="title" placeholder="Enter Last Name" required />
                    
                    <div class="select-list">
                        <select name="user_gender" id="course_type">
                            <option slected value="">Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                    
                    <input type="number" name="user_phone" id="phone_number" placeholder="Phone number" required />
                    <input type="email" name="user_email" id="email" placeholder="Email" required />
                    <input type="password" name="user_password" id="phone_number" placeholder="Password" required />
                    
                    <div class="select-list1">
                        <select name="user_type" id="course_type1">
                            <option slected value="">User Type</option>
                            <option value="student">Student</option>
                            <option value="owners">Owners</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-check">
                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree to the  <a href="#" class="term-service">Terms and Conditions</a></label>
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit" id="submit" class="submit" value="Sign Up" />
                </div>
            </form>
        </div>

    </div>

    <!-- JS -->
    <script src="SignUp_css/vendor/jquery/jquery.min.js"></script>
    <script src="SignUp_css/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
