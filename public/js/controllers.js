'use strict';

function RepositoryControl($scope, all_branches, building_branches, repositories) {

  var state = {
    waiting: 0,
    testing: 1,
    failed: 2,
    needsMerge: 3
  }
8
  $scope.repositories = repositories.query();

  $scope.getBuildingBranches = function(repo) {
    return building_branches.query(repo);
  }

  $scope.addBranch = function(name) {
    $scope.branches.push(name);
  };
}

function MergeCtrl($scope) {
}
