<%@ Page Title="" Language="C#" MasterPageFile="~/pages/QuizMaster.master" AutoEventWireup="true" CodeFile="Quiz.aspx.cs" Inherits="pages_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div ng-controller="QuizController">
        <div class="container " style="margin-top: 30px;">
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="{{activeQuestion==q.qid?'active':''}}" ng-repeat="q in questions"><a href="#tab_{{q.qid}}" ng-click="setActiveQuestion(q.qid)" data-toggle="pill">{{q.title}}</a></li>
                    </ul>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-lg-5">
                            <input type="button" class="btn btn-primary" value="< Previous" ng-click="previous()" ng-disabled="activeQuestion==1"/>
                            <input type="button" class="btn btn-primary" value="Next >" ng-click="next()" ng-disabled="activeQuestion==questions.length"/>
                             <input type="button" class="btn btn-success" value="Submit" ng-click="submit($event)" ng-show="count==questions.length"/>
                       
                            </div>
                    </div>
                    <div class="row">
                        <div class="tab-content col-md-10" ng-repeat="q in questions">
                            <div class="tab-pane {{activeQuestion==q.qid?'active':''}}" id="tab_{{q.qid}}">
                                <h4>{{q.title}}</h4>
                                <p>
                                    {{q.ques}}
                                </p>
                                <div class="radio" ng-repeat="a in updated_ans " >
                                    <label><input type="radio" name="opt{{q.qid}}" ng-click="selectOption($event,a.aid,q.qid)" ng-value="true" ng-model="a.selected"> {{a.ans}}</label>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    <!-- tab content -->
                </div>
            </div>


        </div>
        <!-- end of container -->



          <!-- Result modal -->

                <div class="modal fade" id="rModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h1 >Your Score</h1>
                                    </div>
                                </div>
                            </div>
                            <%-- modal header--%>


                            <div class=" modal-body">

                                <div class="row">
                                    <div class="col-lg-12">
                                        <center>
                                           <h1>{{marks}}/{{total}}</h1> 
                                        </center>
                                         <input type="button" class="btn btn-warning" value="Logout" ng-click="logout($event)"  style="display:inline;"/>

                                   
                                    </div>
                                </div>


                            </div>
                            <%--modal body--%>
                        </div>
                        <%-- modal content--%>
                    </div>
                    <%-- modal dialog--%>
                </div>
                <%--Result modal--%>




    </div>



    <script src="../js/controllers/QuizController.js"></script>
</asp:Content>

