define(['durandal/composition', 'knockout'], function (composition, ko) {

        // hidden: Inverse of 'visible'.
        composition.addBindingHandler('hidden', {
            update: function (element, valueAccessor) {
                var value = ko.utils.unwrapObservable(valueAccessor());
                ko.bindingHandlers.visible.update(element, function () { return !value; });
            }
        });

        // toggle: A 'click' event that flips the state of a boolean observable.
        composition.addBindingHandler('toggle', {
            init: function (element, valueAccessor) {
                var valueObservable = valueAccessor();
                ko.applyBindingsToNode(element, {
                    click: function () {
                        valueObservable(!valueObservable());
                    }
                });
            }
        });

        // foreachproperty: An alternative to 'foreach' that works with objects.
        composition.addBindingHandler('foreachproperty', {
            transformObject: function (obj) {
                var properties = [];
                for (var key in obj) {
                    if (obj.hasOwnProperty(key)) {
                        properties.push({ $key: key, $value: obj[key] });
                    }
                }
                return properties;
            },
            init: function (element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                var value = ko.utils.unwrapObservable(valueAccessor()),
                    properties = ko.bindingHandlers.foreachproperty.transformObject(value);
                ko.applyBindingsToNode(element, { foreach: properties }, bindingContext);
                return { controlsDescendantBindings: true };
            }
        });

        // toJson: Useful for dumping an object into the view for debugging.
        composition.addBindingHandler('toJson', {
            update: function (element, valueAccessor) {
                return ko.bindingHandlers.text.update(element, function () {
                    return ko.toJSON(valueAccessor(), null, 2);
                });
            }
        });

});