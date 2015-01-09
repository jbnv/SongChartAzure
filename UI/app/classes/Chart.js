define(['knockout'], function (ko) {

    var _Chart = function () {
        this.title = ko.observable(); 
        this.route = ko.observable();  
        this.slug = ko.observable();
        this.fullname = ko.observable();
        this.songCount = ko.observable();
        this.songs = ko.observableArray();
    }

    return _Chart;

});
