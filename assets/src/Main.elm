module Main exposing (main)

import Html exposing (text)
import Html.Attributes exposing (attribute)


main =
    Html.node "mwc-button" [ attribute "label" "MWC Button", attribute "raised" "raised" ] []



-- <mwc-button id="myButton" label="Click Me!" raised></mwc-button>
-- text "Hello Elm and Phoenix! 123456"
