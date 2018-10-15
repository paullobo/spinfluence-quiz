var LOGIN;

(function () {

    LOGIN = angular.module("LOGIN", []);

    LOGIN.controller("LoginController", function ($scope, $http) {


        $scope.login = function ($event) {

           // $event.preventDefault();

            $http.post('Login.aspx/login', { user:$scope.user, pass:$scope.pass })
                    .success(function (data, status, headers, config) {

                        if (data.d.split('|')[1] == "0") {
                            $.notify(data.d.split('|')[0], { className: 'warn', position: 'bottom center' });
                        }
                        else if (data.d.split('|')[1] == "2") {
                            $.notify(data.d.split('|')[0], { className: 'error', position: 'bottom center' });

                        }
                        else {
                            window.location = "Dashboard.aspx";
                        }

                    });
     

        };



    });

})();