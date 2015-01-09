define(['knockout', 'classes/DataTable', 'classes/ChartContext'], function (ko, DataTable, ChartContext) {

    /* Properties */

    var isLoading = ko.observable(false);
    var showIsDebut = ko.observable(false);

    var dt = new DataTable({
        'rank': 'Rank',
        'title': 'Title',
        'artist': "Artist",
        'score': 'Score',
        'isDebut': '', // no title
        'debutDate': "Debut Date",
        'debutRank': "Debut Rank",
        'peakRank': "Peak Rank",
        'duration': "Duration (Months)",
        'k': "Coefficient Constant",
        'a': "Ascent Coefficient",
        'b': "Descent Coefficient",
        'timeToPeak': "Time to Peak"
    });
    dt.rowLimit(100);
    dt.sortField('score');
    dt.sortIsAscending(false);
    dt.columns.debutDate.hidden(true);

    var context = new ChartContext();

        /* Methods */

    var activate = function (pContext) {
        isLoading(true);
        context.set(pContext);
        //TODO Load data.
        isLoading(false);
        return 1;
    };

    /* Viewmodel Object */

    return {
        activate: activate,
        // Properties
        data: dt.displayedData,
        columns: dt.columns,
        context: context,
        // Flags
        isLoading: isLoading,
        showIsDebut: showIsDebut,
        // Methods
        showPrevious: function () { /* TODO route to #decade/(context-10) */ },
        showNext: function () { /* TODO route to #decade/(context+10) */ },
        setSort: function (pSortString, pIsAscending) {
            return function () {
                dt.sortField(pSortString);
                dt.sortIsAscending(pIsAscending);
            }
        }
        // Other
    };
});