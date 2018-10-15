<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="pages_Dashboard" %>



<!DOCTYPE html>
<html lang="en" ng-app="DASH">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <%--Title --%>
    <title>Dashboard</title>

    <%-- Favicon --%>
    <link rel="icon" href="../img/core-img/favicon.ico">

    <%--Style CSS --%>
    <link rel="stylesheet" href="../css/style.css">

    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/fonts.css" rel="stylesheet" />


    <%--Scripts--%>
    <script src="../js/angular.min.js"></script>
    <script src="../js/jquery-2.2.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/notify.min.js"></script>



</head>

<body>

    <div ng-controller="DashboardController" ng-cloak>
         <form id="form1" runat="server">
             <div class="header sticky">
                 <h2 style="display:inline;">SPINFLUENCE Quiz Dashboard</h2>
                 <div class="header-right">
                     <input type="button" class="btn btn-warning" value="Logout" ng-click="logout($event)"  style="display:inline;"/>
                        
                 </div>

             </div>
             <div class="container " style="margin-top: 30px;">
                 <div class="row">
                    <div class="input-group">
                        <input id="msg" type="text" class="form-control" ng-model="Search" placeholder="Search Student">
                        <span class="input-group-addon">Search</span>
                      </div>
                 </div>

                 <div class="row" style="margin-top:30px;">
                     <div class="col-lg-3" ng-repeat="s in u_students | filter:Search">
                         <div class="panel panel-{{s.gender?'primary':'danger'}}">
                             <div class="panel-heading"><h4 style="display:inline"> {{s.sname}}</h4><span style="float:right"><h4 style="display:inline">{{s.score}}</h4>/{{total}}</span></div>
                             <div class="panel-body"><i>{{s.email}} <br />{{s.contactno}}</i></div>
                              <div class="panel-body"><span ng-repeat="r in results | filter:{sid:s.sid}">{{r.titleq}} :<b>{{r.titlea}}</b> <br /></span></div>


                         </div>
                     </div>
                 </div>
             </div>
         </form>
    </div>

    <script src="../js/controllers/DashboardController.js"></script>

</body>
</html>




