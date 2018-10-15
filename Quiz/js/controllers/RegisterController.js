var REG;

(function () {

    REG = angular.module("REG", []);

    REG.controller("RegisterController", function ($scope, $http) {


        $scope.submit = function ($event) {


            $event.preventDefault();
            if ($scope.valid()) {
                $event.preventDefault();
                
                $http.post('Register.aspx/register', { sname: $scope.sname, email: $scope.email, gen: $scope.gender, contactno: $scope.contactno, createddt: new Date() })
                    .success(function (data, status, headers, config) {

                        if (data.d.split('|')[1] == "0") {
                            $.notify(data.d.split('|')[0], { className: 'warn', position: 'bottom center' });
                        }
                        else if (data.d.split('|')[1] == "2") {
                            $.notify(data.d.split('|')[0], { className: 'error', position: 'bottom center' });

                        }
                        else {
                            window.location = "Quiz.aspx";
                        }

                    });
            }

           
        };

        $scope.preventDefault = function ($event) {
            $event.preventDefault();
        };

        $scope.valid = function () {

            var r = false;
            var emailpat = /^([a-z A-Z 0-9 _\.\-])+\@(([a-z A-Z 0-9\-])+\.)+([a-z A-z 0-9]{2,3})+$/;
            var contactpat = /^\d{10}$/;

            
            
           
            if ($scope.sname == '' || $scope.sname==null) {

                $.notify('Name Invalid !', { className: 'warn', position: 'bottom center' });
                r = false;
            }
            else if (!emailpat.test($scope.email)) {

                $.notify('Email ID Invalid !', { className: 'warn', position: 'bottom center' });
                r = false;
            }
            
            else if ($scope.gender == null) {

                $.notify('Please Specify Gender', { className: 'warn', position: 'bottom center' });
                r = false;
            }

            else if (!contactpat.test($scope.contactno)) {

                $.notify('Contact No. Invalid !', { className: 'warn', position: 'bottom center' });
                r = false;
            }

            else {
                r = true;
            }

            return r;
        };

    });

})();