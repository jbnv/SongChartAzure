define(['knockout'], function (ko) {

    return {
        // Properties
        serviceUrlBase: "http://songchartsapi.azurewebsites.net/",
        isLoading: ko.observable(false)
        // Methods
        // Other
    };
});