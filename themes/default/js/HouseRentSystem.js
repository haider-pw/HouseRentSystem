/**
 * Created by Syed Haider Hassan on 8/25/14.
 */

;(function(window) {
    var
    // Is Modernizr defined on the global scope
        Modernizr = typeof Modernizr !== "undefined" ? Modernizr : false,
    // whether or not is a touch device
        isTouchDevice = Modernizr ? Modernizr.touch : !!('ontouchstart' in window || 'onmsgesturechange' in window),
    // Are we expecting a touch or a click?
        buttonPressedEvent = (isTouchDevice) ? 'touchstart' : 'click',
        HRS = function() {
            this.init();
        };

    // Initialization method
    HRS.prototype.init = function() {
        this.isTouchDevice = isTouchDevice;
        this.buttonPressedEvent = buttonPressedEvent;
    };

    HRS.prototype.getViewportHeight = function() {

        var docElement = document.documentElement,
            client = docElement.clientHeight,
            inner = window.innerHeight;

        if (client < inner)
            return inner;
        else
            return client;
    };

    HRS.prototype.getViewportWidth = function() {

        var docElement = document.documentElement,
            client = docElement.clientWidth,
            inner = window.innerWidth;

        if (client < inner)
            return inner;
        else
            return client;
    };

    // Creates a "HRS(House Rent System)" object.
    window.HRS = new HRS();
})(this);