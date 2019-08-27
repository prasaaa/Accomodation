<%@page import="com.DatabaseHandle.Property_SELECT"%>
<%@page import="com.DBConnection.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Online Student Accomodation System</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/simple-sidebar2.css" rel="stylesheet">
        <title>Insert title here</title>
    </head>
    <body>

        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">
                <div class="sidebar-heading">Student Accomodation </br> <center>System</center></div>
                <div class="list-group list-group-flush">
                    <a href="#" class="list-group-item list-group-item-action bg-light">Home</a>
                    <a href="add_property.jsp" class="list-group-item list-group-item-action bg-light">Add Property</a> 
                    <hr>
                </div>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav
                    class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <button class="btn btn-primary" id="menu-toggle">Menu</button>

                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                            <li class="nav-item active"><a class="nav-link" href="#">Home
                                    <span class="sr-only">(current)</span>
                                </a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Property Owner</a></li>
                            <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false"> Profile </a>
                                <div class="dropdown-menu dropdown-menu-right"
                                     aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Logout</a> 

                                </div></li>
                        </ul>
                    </div>
                </nav>

                <!--create the big table -->
                <table style="width: 100%; height: 80%;">
                    <!--division of the first two big columns start here -->
                    <tr>
                        <!-- creating first column of the big table-->
                        <td style="width: 80%;">
                            <!--inside the first column -->
                            <div class="table-wrapper-scroll-y my-custom-scrollbar"
                                 style="height: 100%; position: relative;">




                                <!-- -----------CHANGE STARTS HERE FIRST TABLE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                                <table class="table table-bordered table-striped mb-0"
                                       style="position: relative;">

                                    <%
                                        //System.out.println("start");
                                        ResultSet result;
                                        //	System.out.println("pass result");

                                        Connection con = ConnectionManager.getConnection();

                                        Property_SELECT pselect = new Property_SELECT(con, "select * from property");

                                        result = pselect.get_Property_select_table();

                                        while (result.next()) {


                                    %>

                                    <tr>

                                        <td><%= result.getString("property_id")%></td>
                                        <td><%= result.getString("property_name")%></td>
                                        <td><%= result.getString("property_price")%></td>
                                        <td><%= result.getString("property_address")%></td>
                                        <td><%= result.getString("property_type")%></td>
                                        <td><%= result.getString("property_avalability")%></td>
                                        <td>
                                            <form action="Update_Property" method="GET">
                                                <input type="hidden" name="property_id" value="<%=result.getInt("property_id")%>">
                                                <input class="remBtn btn" type="submit" value="Update">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="Delete_Property" method="GET">
                                                <input type="hidden" name="property_id" value="<%=result.getInt("property_id")%>">
                                                <input class="remBtn btn"  type="submit" value="Remove">
                                            </form>
                                        </td>
                                        
                                        
                                    </tr>

                                    <%}%>

                                </table>

                            </div> <!--finish first column-->
                        </td>
                        <!-- start of the next notification column -->

                    </tr>

                    <!-- end of the first table -->
                </table>

                <!--crud buttons -->






            </div>
            <!-- /#wrapper -->

            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Menu Toggle Script -->
            <script>
                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#wrapper").toggleClass("toggled");
                });
            </script>
    </body>

</html>
