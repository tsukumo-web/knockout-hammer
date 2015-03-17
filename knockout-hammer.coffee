
ko = require "knockout-shell"
Hammer = require "./hammer"

for gesture in ["Tap", "Pan", "Swipe", "Pinch", "Rotate", "Press"]
    do ( gesture ) ->
        ko.bindingHandlers["hm#{gesture}"] =
            init: ( element, valueAccessor, allBindingsAccessor, data ) ->
                return false unless (settings = valueAccessor())

                settings = handler: settings unless settings.handler

                settings.event = gesture.toLowerCase()

                handle = ( evt ) ->
                    # polvo:if MODE=debug
                    console.debug "hammer: #{gesture} invoked: ", event
                    # polvo:fi
                    settings.handler.apply data, arguments

                unless element._hammer
                    element._hammer = new Hammer.Manager element,
                        allBindingsAccessor().hmOptions or { }

                element._hammer.add new Hammer[gesture] settings
                element._hammer.on settings.event, handle

                # polvo:if MODE=debug
                console.debug "hammer: #{gesture} registered: #{element.constructor.name}"
                # polvo:fi
                true

