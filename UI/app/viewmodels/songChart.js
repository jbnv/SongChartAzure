define(['plugins/router', 'knockout', 'classes/common', 'classes/DataTable', 'classes/Months'], function (router, ko, common, DataTable, Months) {

    /* Properties */

    var dt = new DataTable({
        'rank': 'Rank',
        'title': 'Title',
        'artist': "Artist",
        'score': 'Score', 
        'debutDate': "Debut Date", // for month, icon if debut
        'debutRank': "Debut Rank",
        'peakRank': "Peak Rank",
        'duration': "Duration (Months)"
        //DEP 'k': "Coefficient Constant",
        //DEP 'a': "Ascent Coefficient",
        //DEP 'b': "Descent Coefficient"
    });
    dt.rowLimit(100);
    dt.sortString('score');
    dt.sortIsAscending(false);

    /* Context */

    var title = ko.observable(); // usually a computed function of value
    var previousRoute = ko.observable(); // usually a computed function of value
    var nextRoute = ko.observable();  // usually a computed function of value
    var top = ko.observable(100);

        /* Methods */

    var activate = function (pContext) {
        changeContext();
        loadData();
        return 1;
    };

    function changeContext() {
        common.isLoading(true);

        route = router.activeInstruction().config.route;
        parameters = router.activeInstruction().params; // array

        // Page observable defaults
        previousRoute(null); 
        nextRoute(null);
        //TODO showIsDebut(false); (this should actually be done as a column definition)

        if (!route) {
            // This should never happen.

        } else if (route == "topByPeak") {
            title('Top Songs by Peak Position');

        } else if (route == "topByDebut") {
            title('Top Songs by Debut Position');

        } else if (route == "topByDuration") {
            title('Top Songs by Longevity');

        } else if (route == "artist/:artist") {
            pArtistSlug = parameters[0];
            title('TODO Artist Name');

        } else if (route == "decade/:decade") {
            pDecade = parseInt(parameters[0]);
            title('' + pDecade + 's');
            previousRoute('#decade/'+(pDecade-10));
            nextRoute('#decade/'+(pDecade+10));

        } else if (route == "year/:year") {
            pYear = parseInt(parameters[0]);
            title('' + pYear);
            previousRoute('#year/'+(pYear-1));
            nextRoute('#year/'+(pYear+1));

        } else if (route == "month/:year/:month") {
            pYear = parseInt(parameters[0]);
            pMonth =parseInt( parameters[1]);
            monthName = Months[pMonth-1];
            title(monthName+' ' + pYear);
            if (pMonth == 1) {
                previousRoute('#month/'+(pYear-1)+'/12');
            } else {
                previousRoute('#month/'+(pYear)+'/'+(pMonth-1));
            }
            if (pMonth == 12) {
                nextRoute('#month/'+(pYear+1)+'/1');
            } else {
                nextRoute('#month/'+(pYear)+'/'+(pMonth+1));
            }

        } else {
            //    console.log('Clearing display array.');
            //    $scope.displayArray = [];
            title('(Invalid or null filter)');
        }
    }

    function loadData() {

        $.ajax({
            url: common.serviceUrlBase + "songcharts/" + router.activeInstruction().fragment,
            dataType: "json",
            type: "GET",
            //xhrFields: {
            //    withCredentials: true
            //},
            success: function (pData, pStatus, pRequest) {
                dt.data(pData)
            },
            error: function (pData, pStatus, pError) {
                toastr.error("An error occurred while loading home page data.");
            },
            complete: function () {
                common.isLoading(false);
            }
        });
    }

    /* Viewmodel Object */

    return {
        activate: activate,
        // Properties
        data: dt.data, //TEMP dt.displayedData,
        columns: dt.columns,
        title: title,
        previousRoute: previousRoute,
        nextRoute: nextRoute,
        // Flags
        isLoading: common.isLoading,
        // Methods
        setSort: function (pSortString, pIsAscending) {
            return function () {
                dt.sortField(pSortString);
                dt.sortIsAscending(pIsAscending);
            }
        }
        // Other
    };
});