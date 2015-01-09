define(['knockout', 'jquery','toastr','classes/common'], function (ko,$,toastr,common) {

    /* Properties */

    var decades = ko.observable();

    /* Methods */

    var activate = function (pContext) {
        common.isLoading(true);
        $.ajax({
            url: common.serviceUrlBase + "home",
            dataType: "json",
            type: "GET",
            //xhrFields: {
            //    withCredentials: true
            //},
            success: function (pData, pStatus, pRequest) {
                decades(pData.Decades);
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
        decades: decades
    };
});