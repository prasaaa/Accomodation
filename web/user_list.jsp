<%@page import="com.DatabaseHandle.Users_SELECT"%>
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

        <title>User List</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/simple-sidebar2.css" rel="stylesheet">
        <title>User List</title>
    </head>
    <body>

        <div class="d-flex" id="wrapper">

            <!-- Sidebar -->
            <div class="bg-light border-right" id="sidebar-wrapper">


            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">

                <nav
                    class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <h1>User List</h1>

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
                            <li class="nav-item"><a class="nav-link" href="#">Admin</a></li>
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

                                    <tr>
                                        <th>User Id</th>
                                        <th>User First Name</th>
                                        <th>User Last Name</th>
                                        <th>User Gender</th>
                                        <th>User Type</th>
                                        <th>User Phone</th>
                                        <th>User Email</th>
                                         <th>Remove</th>
                                    </tr>
                                    <%
                                        //System.out.println("start");
                                        ResultSet result;
                                        //	System.out.println("pass result");

                                        Connection con = ConnectionManager.getConnection();

                                        Users_SELECT uselect = new Users_SELECT(con, "select * from user");

                                        result = uselect.get_User_select_table();

                                        while (result.next()) {


                                    %>

                                    <tr>



                                        <td><%= result.getString("user_id")%></td>
                                        <td><%= result.getString("user_firstName")%></td>
                                        <td><%= result.getString("user_lastName")%></td>
                                        <td><%= result.getString("user_gender")%></td>
                                        <td><%= result.getString("user_type")%></td>                                        
                                        <td><%= result.getString("user_phone")%></td>
                                        <td><%= result.getString("user_email")%></td>


                                        <td>
                                            <form action="Delete_Owner" method="GET">
                                                <input type="hidden" name="user_id" value="<%=result.getInt("user_id")%>">
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
