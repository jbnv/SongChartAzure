define(['plugins/router', 'durandal/app','knockout'], function (router, app,ko) {

    var searchTerm = ko.observable();

    return {
        router: router,
        search: function () {
            term = ''+searchTerm();
            console.log('searchTerm', term);
            if (result = term.match(/^(\d\d\d\d)s$/)) {
                router.navigate('decade/' + result[1]);
                return;
            }
            if (result = term.match(/^(\d\d\d\d)$/)) {
                router.navigate('year/' + result[1]);
                return;
            }
            if (result = term.match(/^(\d\d\d\d)-(\d\d)$/)) {
                router.navigate('month/' + result[1] + '/' + result[2]);
                return;
            }
            app.showMessage('Search for "' + term + '" not yet implemented.');
        },
        activate: function () {
            router.map([
                { route: '', title:'Home Screen', moduleId: 'viewmodels/home' },
                { route: 'decade/:decade', title: 'Decade Chart', moduleId: 'viewmodels/songChart' },
                { route: 'year/:year', title: 'Year Chart', moduleId: 'viewmodels/songChart' },
                { route: 'month/:year/:month', title: 'Month Chart', moduleId: 'viewmodels/songChart' },
                { route: 'song/:id', title: 'Song Details', moduleId: 'viewmodels/artist' },
                { route: 'artist/:id', title: 'Artist Details', moduleId: 'viewmodels/artist' },
                { route: 'genre/:id', title: 'Genre Details', moduleId: 'viewmodels/genre' },
                //TODO { route: 'artists', title: 'Artists', moduleId: 'viewmodels/artistChart', nav: true },
                //TODO { route: 'genres', title: 'Genres', moduleId: 'viewmodels/genreChart', nav: true },
                { route: 'topByPeak', title: 'Top by Peak Rank', moduleId: 'viewmodels/songChart', nav: true },
                { route: 'topByDebut', title: 'Top by Debut Rank', moduleId: 'viewmodels/songChart', nav: true },
                { route: 'topByDuration', title: 'Top by Longevity', moduleId: 'viewmodels/songChart', nav: true }
            ]).buildNavigationModel();
            
            return router.activate();
        },
        searchTerm: searchTerm
    };
});