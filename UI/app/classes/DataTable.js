define(['knockout'], function (ko) {

    var _Column = function (title) {
        this.title = title;
        this.hidden = ko.observable(false);
        this.ascendingSortFn = function(l,r) { return l > r ? 1 : -1 };
        this.descendingSortFn = function(l,r) { return l > r ? -1 : 1 };
    }

    /* -------------------------------------------------------------------------------- */

    // init: { column slug: column title }
    var _DataTable = function (init) {

        this.data = ko.observableArray();
        this.columns = {};
        this.filter = ko.observable();
        this.sortString = ko.observable();
        this.sortIsAscending = ko.observable(true);
        this.rowLimit = ko.observable();

        var $this = this;

        // For now, only single-field sorting is supported.
        function sortFn() {
            fieldSlug = $this.sortString();
            if ($this.sortIsAscending()) {
                return function(l,r) { return l[fieldSlug] > r[fieldSlug] ? 1 : -1 };
            } else {
                return function(l,r) { return l[fieldSlug] > r[fieldSlug] ? -1 : 1 };
            }
        }

        this.displayedData = ko.computed(function () {
            var d = $this.data.sort(sortFn());
            if ($this.rowLimit()) { d = d.splice(0, $this.rowLimit()); }
            return d;
        });
            

        if (init) {
            for (var slug in init) {
                this.columns[slug] = new _Column(init[slug]);
            }
        };
    };

    _DataTable.prototype.showColumns = function () {
        var columnsToShow = [];
        for (var index in arguments) {
            columnsToShow.push(arguments[index]);
        }
        for (var slug in columns) {
            columns[slug].hidden(columnsToShow.indexOf(slug) == -1);
        }
    }

    return _DataTable;
});