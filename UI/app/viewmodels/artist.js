define(['knockout', 'classes/Artist', 'classes/Song'], function (ko, Artist, Song) {

    /* Properties */

    var artistFullname = ko.observable();
    var data = ko.observable();

    /* Methods */

    var activate = function (context) {
        isLoading(true);
        artistFullname(context);
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