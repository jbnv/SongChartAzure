define(['plugins/router', 'durandal/app'], function (router, app) {
    return {
        router: router,
        search: function() {
            //It's really easy to show a message box.
            //You can add custom options too. Also, it returns a promise for the user's response.
            app.showMessage('Search not yet implemented...');
        },
        activate: function () {
            router.map([
                { route: '', title:'Home Screen', moduleId: 'viewmodels/home', nav: true },
                { route: 'decade/:decade', title: 'Decade Chart', moduleId: 'viewmodels/decade', nav: true },
                { route: 'year/:year', title: 'Year Chart', moduleId: 'viewmodels/year', nav: true },
                { route: 'month/:year/:month', title: 'Month Chart', moduleId: 'viewmodels/month', nav: true },
                { route: 'artist/:artist', title: 'Arist Chart', moduleId: 'viewmodels/artist', nav: true },
                { route: 'genre/:genre', title: 'Genre Chart', moduleId: 'viewmodels/genre', nav: true }
            ]).buildNavigationModel();
            
            return router.activate();
        }
    };
});