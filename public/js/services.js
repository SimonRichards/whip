'use strict';

angular.module('whip.services', ['ngResource']).
  factory('branches', function($resource) {
    return $resource('./:repository/:branchName.json');
  }).
  factory('repositories', function($resource) {
    return $resource('repositories.json');
  });