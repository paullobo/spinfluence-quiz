<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="pages_Register" %>

<!DOCTYPE html>

<html lang="en" ng-app="REG">
<head runat="server">
    <title>Spinfluence</title>
    
    <%--Style CSS --%>
    <link href="../css/style.css" rel="stylesheet" />

    <%-- Favicon --%>
    <link rel="icon" href="../img/favicon.ico">
   
    <%--Scripts--%>
    <script src="../js/angular.min.js"></script>
    <script src="../js/jquery-2.2.4.min.js"></script>
    <script src="../js/notify.min.js"></script>


</head>
<body id="grad">
    <form id="form1" runat="server">
    </form>

     <div ng-controller="RegisterController"   ng-cloak>
            <div class="login-page">
                <div class="form">
                    <form name="myForm" class="login-form"  >
                        <input type="text" name="sname" placeholder="Name" ng-model="sname" required autofocus/>
                        <input type="email" name="email" placeholder="Email Id" ng-model="email" required/>
                        <select name="gender" ng-model="gender" required>
                            <option value="" selected disabled>Gender</option>
                            <option value="true">Male</option>
                            <option value="false">Female</option> 
                        </select>
                        <input type="tel" name="contactno"  ng-model="contactno"  placeholder="Mobile No." pattern="\d{10}" required />
                        <button type="submit" ng-click="submit($event)" >Take Test</button>
                    </form>
                </div>
            </div>
        </div>

        <script src="../js/controllers/RegisterController.js"></script>
</body>
</html>
