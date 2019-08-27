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
    <title>Update Property</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="SignUp_css/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="SignUp_css/css/reg_property.css">
</head>
<body>

    <div class="main">

        <div class="container">
            <form method="POST" class="appointment-form" id="appointment-form" action="Property_Update_Controller" method="POST">
                <h2>Update Property</h2>
                <div class="form-group-1">
                    
                                       
                    <input type="text" name="property_name" id="title" placeholder="Property Name" required />
                    <input type="number" name="property_price" id="title" placeholder="Property Price" required />
                    <input type="text" name="property_address" id="phone_number" placeholder="Property Address" required />
                    <div class="select-list">
                        <select name="property_type" id="course_type">
                            <option slected value="">Property</option>
                            <option value="room">Room</option>
                            <option value="house">House</option>
                        </select>
                    </div>
                    <input type="text" name="property_avalability" id="title" placeholder="Property Avalability" required />
                   
                </div>
                
                <div class="form-check">
                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree to the  <a href="#" class="term-service">Terms and Conditions</a></label>
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit" id="submit" class="submit" value="Add Property" />
                </div>
            </form>
        </div>

    </div>

    <!-- JS -->
    <script src="SignUp_css/vendor/jquery/jquery.min.js"></script>
    <script src="SignUp_css/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
