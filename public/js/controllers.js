'use strict';

function BranchCtrl($scope, branches, repositories) {

  var state = {
    waiting: 0,
    testing: 1,
    failed: 2,
    needsMerge: 3
  }

  $scope.repositories = repositories.query();

  $scope.addBranch = function(name) {
    $scope.branches.push(name);
  };
}

function MergeCtrl($scope) {
}
