module Main exposing (main)

import Components.Button as Button
import Html exposing (Html)


main : Html msg
main =
    Button.new
        |> Button.raised True
        |> Button.label "Componentized!"
        |> Button.render



-- <mwc-button id="myButton" label="Click Me!" raised></mwc-button>
-- text "Hello Elm and Phoenix! 123456"
