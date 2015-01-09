define(['knockout'], function (ko) {

    var _Song = function() {
        this.fullname = ko.observable();
        this.title = ko.observable();
            this.artist = ko.observable();
            this.genre = ko.observable();
    }

    _Song.prototype.getOne = function (fullname) {

    }

    return _Song;
});