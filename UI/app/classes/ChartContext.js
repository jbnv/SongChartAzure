define(['plugins/router', 'knockout', 'classes/Months'], function (router,ko, Months) {

    var _ChartContext = function () {

        this.title = ko.observable(); // usually a computed function of value
        this.previousRoute = ko.observable(); // usually a computed function of value
        this.nextRoute = ko.observable();  // usually a computed function of value
        this.top = ko.observable(100);

        this.serviceRoute = "songcharts/" + router.activeInstruction().fragment;

        route = router.activeInstruction().config.route;
        parameters = router.activeInstruction().params; // array

        if (!route) {
            // This should never happen.

        } else if (route == "topByPeak") {
            this.title('Top Songs by Peak Position');
            this.previousRoute(null); // not applicable for this route
            this.nextRoute(null);
                //    $scope.dataParameters = { 'sortField': '-peakRank', 'top': 100 };
            //    $scope.columns.show('rank', 'score');
            //    $scope.columns.hide('debutDate', 'projectedRank');
            //    //TODO 

        } else if (route == "topByDebut") {
            this.title('Top Songs by Debut Position');
            this.previousRoute(null); // not applicable for this route
            this.nextRoute(null);
            //    $scope.dataParameters = { 'sortField': '-debutRank', 'top': 100 };
        //    $scope.columns.show('rank', 'score');
        //    $scope.columns.hide('debutDate', 'projectedRank');
        //    //TODO 

        } else if (route == "topByDuration") {
            this.title('Top Songs by Longevity');
            this.previousRoute(null); // not applicable for this route
            this.nextRoute(null);
            //    $scope.dataParameters = { 'sortField': '-duration', 'top': 100 };
        //    $scope.columns.show('rank', 'score');
        //    $scope.columns.hide('debutDate', 'projectedRank');
        //    //TODO 

        } else if (route == "artist/:artist") {
            pArtistSlug = parameters[0];
            this.title('TODO Artist Name');
            this.previousRoute(null); // not applicable for this route
            this.nextRoute(null);

        } else if (route == "decade/:decade") {
            pDecade = parseInt(parameters[0]);
            this.title('' + pDecade + 's');
            this.previousRoute('#decade/'+(pDecade-10));
            this.nextRoute('#decade/'+(pDecade+10));
        //    $scope.columns.show('rank');
        //    $scope.columns.hide('debutDate');
        //    $scope.columns.hide('projectedRank');
        //    $scope.columns.show('score');
        //    $scope.showIsDebut = false;
        //    $scope.dataParameters = {
        //        'pagename': 'calendar:' + pDecade + 's',
        //        'decade': pDecade,
        //        'sortField': '-score',
            //    }; //TODO add refresh

        } else if (route == "year/:year") {
            pYear = parseInt(parameters[0]);
            this.title('' + pYear);
            this.previousRoute('#year/'+(pYear-1));
            this.nextRoute('#year/'+(pYear+1));
            //        $scope.dataParameters.pagename = 'calendar:' + pYear;
            //        this.title(pYear;
            //        $scope.showIsDebut = false;
            //        $scope.columns.hide('projectedRank');
            //        $scope.columns.show('score');
            //        $scope.dataParameters.sortField = '-score';
            //        $scope.dataParameters.transformFn = function (songDataArray) {
            //    pDecade = pYear - pYear % 10;
        //    $scope.filter = {
        //        decade: pDecade, year: pYear, month: pMonth
        //    };
        //    $scope.display = {
        //        decade: '' + pDecade + 's', year: '' + pYear, month: pMonth ? $scope.months[pMonth - 1] : 'Select Month'
        //    };
        //    $scope.columns.show('rank');
            //    $scope.columns.hide('debutDate');

        } else if (route == "month/:year/:month") {
            pYear = parseInt(parameters[0]);
            pMonth =parseInt( parameters[1]);
            this.monthName = Months[pMonth-1];
                this.title(this.monthName+' ' + pYear);
                if (pMonth == 1) {
                    this.previousRoute('#month/'+(pYear-1)+'/12');
                } else {
                    this.previousRoute('#month/'+(pYear)+'/'+(pMonth-1));
                }
                if (pMonth == 1) {
                    this.nextRoute('#month/'+(pYear+1)+'/1');
                } else {
                    this.nextRoute('#month/'+(pYear)+'/'+(pMonth+1));
                }
        //        $scope.dataParameters.pagename = 'calendar:' + pYear + '-' + ('0' + pMonth).substr(0, 2);
        //        $scope.dataParameters.month = pMonth;
        //        $scope.showIsDebut = true;
        //        $scope.columns.show('projectedRank');
        //        $scope.columns.hide('score');
            //        $scope.dataParameters.sortField = 'projectedRank';

        } else {
        //    console.log('Clearing display array.');
        //    $scope.displayArray = [];
            this.title('(Invalid or null filter)');
        }

    }

    return _ChartContext;
});
