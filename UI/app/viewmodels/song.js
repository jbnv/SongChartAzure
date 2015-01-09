define(['knockout', 'classes/Song'], function (ko, Song) {

    /* Properties */

    var songFullname = ko.observable();
    var data = ko.observable();

    //$scope.song = song;

    //$scope.ok = function () {
    //    $modalInstance.close();
    //};

    //$scope.pivot = function (pointRanks) {
    //    returnValue = [];
    //    for (index in pointRanks) {
    //        if (index % 4 == 0) {
    //            month = [];
    //            returnValue.push(month);
    //        }
    //        month.push(pointRanks[index]);
    //    }
    //    return returnValue;
    //}

    /* Methods */

    var activate = function (context) {
        isLoading(true);
        songFullname(context);
        //TODO Load data.
        isLoading(false);
        return 1;
    };

    /* Viewmodel Object */

    return {
        activate: activate,
        // Properties
        data: data
    };
});