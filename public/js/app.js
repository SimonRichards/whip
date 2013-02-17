'use strict';

// Declare app level module which depends on filters, and services
angular.module('whip', ['whip.filters', 'whip.services', 'whip.directives']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/queue', {templateUrl: 'partials/queue.html', controller: RepositoryControl});
    $routeProvider.when('/merge', {templateUrl: 'partials/merge.html', controller: MergeCtrl});
    $routeProvider.otherwise({redirectTo: '/queue'});
  }]);
