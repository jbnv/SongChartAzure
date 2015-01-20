define(['plugins/router', 'knockout', 'classes/common', 'classes/DataTable', 'classes/Months'], function (router, ko, common, DataTable, Months) {

    var data = ko.observable();

    /* Methods */

    var activate = function (pContext) {
        loadData();
        return 1;
    };

    function loadData() {

        $.ajax({
            url: common.serviceUrlBase + "rankconflicts",
            dataType: "json",
            type: "GET",
            //xhrFields: {
            //    withCredentials: true
            //},
            success: function (pData, pStatus, pRequest) {
                data(pData)
            },
            error: function (pData, pStatus, pError) {
                toastr.error("An error occurred while loading home page data.");
            },
            complete: function () {
                common.isLoading(false);
            }
        });
    }


    /* Viewmodel Object */

    return {
        activate: activate,
        // Properties
        data: data, 
    };

});