(function () {



    QUIZ.controller("QuizController", function ($scope, $http) {


        $scope.refreshOptions = function () {
            $scope.updated_ans = [];
            $.each($scope.answers, function (i, o) {
                if ($scope.activeQuestion == o.qid) {
                    $scope.updated_ans.push(o);
                }

            });

        }
      

        $scope.getPageData = function () {

            $http.post('quiz.aspx/getQuestions', { user: 'paul' })
                .success(function (data, status, headers, config) {
                    $scope.questions = data.d;
                });

            $http.post('quiz.aspx/getAnswers', { user: 'paul' })
                .success(function (data, status, headers, config) {
                    $scope.answers = data.d;
                    $.each($scope.answers, function (i, o) {
                        o.selected = false;
                        o.createddt = new Date();
                    });
                    $scope.refreshOptions();
                });

        };

        $scope.getPageData();


        $scope.activeQuestion = 1;
        $scope.selectedOpt = [];
        $scope.showSubmit = false;

        $scope.setActiveQuestion = function (qid) {
            $scope.activeQuestion = qid;
            $scope.refreshOptions();

        };


       

        $scope.previous = function () {
            if ($scope.activeQuestion > 1) {
                $scope.activeQuestion -= 1;
            }
            $scope.refreshOptions();
        };

        $scope.next = function () {
            if ($scope.activeQuestion < $scope.questions.length) {
                $scope.activeQuestion += 1;
            }
            $scope.refreshOptions();
        };

        console.log($scope.selectedOpt);

        $scope.selectOption = function ($event, aid, qid) {
            $scope.count = 0;
            $.each($scope.answers, function (i, o) {
                if (o.qid == qid) { o.selected = false; }
                if (o.aid == aid) {
                    o.selected = true;
                }
                if (o.selected == true) {
                    $scope.count++;
                }
            });

        };


        $scope.submit = function ($event) {
            $event.preventDefault();
            $scope.ans = [];
            $.each($scope.answers, function (i, o) {
                delete o.__type;
                if (o.selected == true) {
                    $scope.ans.push(o);
                }
            });
                $http.post('Quiz.aspx/submit', {tbl_ua:$scope.ans })
                    .success(function (data, status, headers, config) {

                        if (data.d.split('|')[1] == "0") {
                            $.notify(data.d.split('|')[0], { className: 'warn', position: 'bottom center' });
                            $scope.getResults();
                            $("#rModal").modal('show');
                        }
                        else if (data.d.split('|')[1] == "2") {
                            $.notify(data.d.split('|')[0], { className: 'error', position: 'bottom center' });

                        }
                        else {
                            $.notify(data.d.split('|')[0], { className: 'success', position: 'bottom center' });
                            $scope.getResults();
                            $("#rModal").modal('show');
                            

                        }

                    });

        };


        $scope.getResults = function () {

            $http.post('Quiz.aspx/getResults', { })
                .success(function (data, status, headers, config) {

                  
                        $scope.results = data.d;

                        console.log($scope.results);
                        $scope.marks = 0;

                        $scope.total = 0;
                        $.each($scope.questions, function (i, o) {
                            $scope.total++;
                        });

                        $.each($scope.results, function (i, o) {
                            if (o.correct == true) {
                                $scope.marks++;
                            }
                        });

                    

                });
           
        }



        $scope.logout = function ($event) {
           
            $http.post('register.aspx/logout', { username: '' })
                .success(function (data, status, headers, config) {
                    window.location = "Register.aspx";
                });
        };

    });

})();