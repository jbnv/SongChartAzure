define(['knockout','classes/Months'], function (ko,Months) {

    var _ChartContext = function() {
        this.title = ko.observable(); // usually a computed function of value
        this.previousRoute = ko.observable(); // usually a computed function of value
        this.nextRoute = ko.observable();  // usually a computed function of value
        this.top = ko.observable(100);
    }

    _ChartContext.prototype.set = function(pContext) {
            if (!pContext) {
            //    $scope.filter = {
            //        decade: 0, year: 0, month: 0
            //    };
            //    $scope.display = {
            //        decade: "Main Menu", year: "Year", month: "Month"
            //    };
            //    return;
            } else if (pContext.topByPeak) {
            //    $scope.resultTitle = 'Top Songs by Peak Position';
            //    $scope.dataParameters = { 'sortField': '-peakRank', 'top': 100 };
            //    $scope.columns.show('rank', 'score');
            //    $scope.columns.hide('debutDate', 'projectedRank');
            //    //TODO 
            } else if (pContext.topByDebut) {
            //    $scope.resultTitle = 'Top Songs by Debut Position';
            //    $scope.dataParameters = { 'sortField': '-debutRank', 'top': 100 };
            //    $scope.columns.show('rank', 'score');
            //    $scope.columns.hide('debutDate', 'projectedRank');
            //    //TODO 
            } else if (pContext.topByDuration) {
            //    $scope.resultTitle = 'Top Songs by Longevity';
            //    $scope.dataParameters = { 'sortField': '-duration', 'top': 100 };
            //    $scope.columns.show('rank', 'score');
            //    $scope.columns.hide('debutDate', 'projectedRank');
            //    //TODO 
            } else if (pContext.artist) {
            //    //TODO 
            } else if (pContext.decade) {
                this.title('' + pContext.decade + 's');
                this.previousRoute('#decade/'+(pContext.decade-10));
                this.nextRoute('#decade/'+(pContext.decade+10));
            //    $scope.columns.show('rank');
            //    $scope.columns.hide('debutDate');
            //    $scope.columns.hide('projectedRank');
            //    $scope.columns.show('score');
            //    $scope.showIsDebut = false;
            //    $scope.dataParameters = {
            //        'pagename': 'calendar:' + p.decade + 's',
            //        'decade': p.decade,
            //        'sortField': '-score',
            //    }; //TODO add refresh
            //    getSongChartData();
            } else if (pContext.year) {
                //    p.decade = p.year - p.year % 10;
            //    $scope.filter = {
            //        decade: p.decade, year: p.year, month: p.month
            //    };
            //    $scope.display = {
            //        decade: '' + p.decade + 's', year: '' + p.year, month: p.month ? $scope.months[p.month - 1] : 'Select Month'
            //    };
            //    $scope.columns.show('rank');
            //    $scope.columns.hide('debutDate');
            //    $scope.dataParameters = { 'year': p.year }; //TODO add refresh
                if (pContext.month) {
                    this.monthName = Months[pContext.month-1];
                    this.title(this.monthName+' ' + pContext.year);
                    if (pContext.month == 1) {
                        this.previousRoute('#month/'+(pContext.year-1)+'/12');
                    } else {
                        this.previousRoute('#month/'+(pContext.year)+'/'+(pContext.month-1));
                    }
                    if (p.month == 1) {
                        this.nextRoute('#month/'+(pContext.year+1)+'/1');
                    } else {
                        this.nextRoute('#month/'+(pContext.year)+'/'+(pContext.month+1));
                    }
            //        $scope.dataParameters.pagename = 'calendar:' + p.year + '-' + ('0' + p.month).substr(0, 2);
            //        $scope.dataParameters.month = p.month;
            //        $scope.showIsDebut = true;
            //        $scope.columns.show('projectedRank');
            //        $scope.columns.hide('score');
            //        $scope.dataParameters.sortField = 'projectedRank';
                } else {
                    this.title('' + pContext.year);
                    this.previousRoute('#year/'+(pContext.year-1));
                    this.nextRoute('#year/'+(pContext.year+1));
                //        $scope.dataParameters.pagename = 'calendar:' + p.year;
            //        $scope.resultTitle = p.year;
            //        $scope.showIsDebut = false;
            //        $scope.columns.hide('projectedRank');
            //        $scope.columns.show('score');
            //        $scope.dataParameters.sortField = '-score';
            //        $scope.dataParameters.transformFn = function (songDataArray) {
            //            return {
            //                rank: 0, //TODO
            //                slug: songDataArray[0],
            //                title: songDataArray[1],
            //                artist: songDataArray[2],
            //                score: songDataArray[3],
            //                debutRank: songDataArray[4],
            //                peakRank: songDataArray[5],
            //                duration: songDataArray[6]
            //            };
            //        };
                }
            //    getSongChartData();
            } else {
            //    console.log('Clearing display array.');
            //    $scope.displayArray = [];
                this.title('(Invalid or null filter)');
            }

        }

    return _ChartContext;
});
