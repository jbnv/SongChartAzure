define(['knockout', 'jquery','toastr','classes/common'], function (ko,$,toastr,common) {

    /* Properties */

    var decades = ko.observable();
    var artists = ko.observable();
    var genres = ko.observable();
    var commonWords = ko.observable();
    var uniqueWords = ko.observable();

    /* Methods */

    var activate = function (pContext) {
        common.isLoading(true);
        // May have to break this up into separate calls if it takes too long to load all of the data.
        // Separate calls would allow data to come in parts.
        $.ajax({
            url: common.serviceUrlBase + "home",
            dataType: "json",
            type: "GET",
            //xhrFields: {
            //    withCredentials: true
            //},
            success: function (pData, pStatus, pRequest) {
                decades(pData.Decades);
                artists(pData.Artists);
                genres(pData.Genres);
                commonWords(pData.CommonWords);
                uniqueWords(pData.UniqueWords);
            },
            error: function (pData, pStatus, pError) {
                toastr.error("An error occurred while loading home page data.");
            },
            complete: function () {
                common.isLoading(false);
            }
        });
        return 1;
    };

    return {
        activate: activate,
        decades: decades,
        artists: artists,
        genres: genres,
        commonWords: commonWords,
        uniqueWords: uniqueWords
    };
});