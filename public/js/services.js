'use strict';

angular.module('whip.services', ['ngResource']).
  factory('all_branches', function($resource) {
    return $resource('repositories/:repository/all_branches');
  }).
  factory('building_branches', function($resource) {
    return $resource('repositories/:repository/building-branches');
  }).
  factory('repositories', function($resource) {
    return $resource('repositories');
  });