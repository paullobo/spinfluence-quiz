<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="pages_Login" %>

<!DOCTYPE html>

<html lang="en" ng-app="LOGIN">
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
<body id="gradg">
    <form id="form1" runat="server">
    </form>

     <div ng-controller="LoginController"  ng-cloak>
            <div class="login-page">
                <div class="form">
                    <form name="myForm" class="login-form"  >
                        <input type="text" name="user" placeholder="UserName" ng-model="user" required autofocus/>
                          <input type="password" name="pass" placeholder="Password" ng-model="pass" required />
                        <button type="submit" ng-click="login($event)" >Login</button>
                    </form>
                </div>
            </div>
        </div>

        <script src="../js/controllers/LoginController.js"></script>
</body>
</html>
