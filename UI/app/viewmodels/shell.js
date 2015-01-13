﻿define(['plugins/router', 'durandal/app','knockout'], function (router, app,ko) {

    var searchTerm = ko.observable();

    return {
        router: router,
        search: function () {
            term = ''+searchTerm();
            console.log('searchTerm', term);
            if (result = term.match(/^(\d\d\d\d)s$/)) {
                router.navigate('#decade/'+result[1]);
            }
            if (result = term.match(/^(\d\d\d\d)$/)) {
                router.navigate('#year/' + result[1]);
            }
            if (result = term.match(/^(\d\d\d\d)-(\d\d)$/)) {
                router.navigate('#month/' + result[1] + '/' + result[2]);
            }
            app.showMessage('Search for "' + term + '" not yet implemented.');        },
        activate: function () {
            router.map([
                { route: '', title:'Home Screen', moduleId: 'viewmodels/home', nav: true },
                { route: 'decade/:decade', title: 'Decade Chart', moduleId: 'viewmodels/songChart', nav: true },
                { route: 'year/:year', title: 'Year Chart', moduleId: 'viewmodels/songChart', nav: true },
                { route: 'month/:year/:month', title: 'Month Chart', moduleId: 'viewmodels/songChart', nav: true },
                { route: 'song/:id', title: 'Song Details', moduleId: 'viewmodels/artist', nav: true },
                { route: 'artist/:id', title: 'Artist Details', moduleId: 'viewmodels/artist', nav: true },
                { route: 'genre/:id', title: 'Genre Details', moduleId: 'viewmodels/genre', nav: true }
            ]).buildNavigationModel();
            
            return router.activate();
        },
        searchTerm: searchTerm
    };
});