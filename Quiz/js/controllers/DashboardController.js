var DASH;

(function () {

    DASH = angular.module("DASH", []);

    DASH.controller("DashboardController", function ($scope, $http,$timeout) {


       

   

            $http.post('Dashboard.aspx/getStudents', { user: 'paul' })
                .success(function (data, status, headers, config) {
                    $scope.students = data.d;
                   
                });

            $http.post('quiz.aspx/getQuestions', { user: 'paul' })
                .success(function (data, status, headers, config) {
                    $scope.questions = data.d;
                  
                });


            $http.post('Dashboard.aspx/getResults', {})
                .success(function (data, status, headers, config) {
                    $scope.results = data.d;

                   
                });

            
        

        
  
        $timeout(function () { $scope.scoreCalc() },1000);
        

        $scope.logout = function ($event) {
           
            $http.post('login.aspx/logout', { username: '' })
                .success(function (data, status, headers, config) {
                    window.location = "Login.aspx";
                });
        };


        

        $scope.scoreCalc = function () {

            

            $scope.total = 0;
            $scope.u_students = $scope.students;
           
            $.each($scope.questions, function (i, o) {
                $scope.total++;
            });

            
            $.each($scope.u_students, function (i, o) {
                o.score = 0;
                $.each($scope.results, function (ind, obj) {
                    if (o.sid == obj.sid && obj.correct == true) {
                        o.score++;
                    }
                });
            });


            
        };




    });

})();