define(['knockout', 'classes/common', 'classes/DataTable', 'classes/ChartContext'], function (ko, common,DataTable, ChartContext) {

    /* Properties */

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
        'b': "Descent Coefficient"
    });
    dt.rowLimit(100);
    dt.sortString('score');
    dt.sortIsAscending(false);
    dt.columns.debutDate.hidden(true);

    var context = new ChartContext();

        /* Methods */

    var activate = function (pContext) {
        common.isLoading(true);
        $.ajax({
            url: common.serviceUrlBase + context.serviceRoute,
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
        return 1;
    };

    /* Viewmodel Object */

    return {
        activate: activate,
        // Properties
        data: dt.data, //TEMP dt.displayedData,
        columns: dt.columns,
        context: context,
        // Flags
        isLoading: common.isLoading,
        showIsDebut: showIsDebut,
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