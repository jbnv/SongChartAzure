define(['knockout'], function (ko) {

    var _Song = function (data) {
        if (data) {
            this.title = ko.observable(data.Title);
            this.genre = ko.observable(data.Genre);
        } else {
            this.title = ko.observable();
            this.genre = ko.observable();
        }
    }

    return _Song;
});