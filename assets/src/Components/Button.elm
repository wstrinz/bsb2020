module Components.Button exposing (Button, label, new, onClick, raised, render)

import Html exposing (Attribute, Html, node)
import Html.Attributes exposing (attribute)
import Html.Events exposing (on)
import Json.Decode
import Logic
import Maybe.Extra exposing (cons)
import Types exposing (Msg)


type alias Button a =
    { label : String
    , raised : Bool
    , onClick : Maybe a
    }


new : Button a
new =
    { label = ""
    , raised = False
    , onClick = Nothing
    }


render : Button a -> Html a
render button =
    let
        attrs =
            [ attribute "label" button.label ]
                |> Logic.appendWhen
                    button.raised
                    (attribute "raised" "raised")
                |> cons (onClickToAttribute button.onClick)
    in
    node "mwc-button" attrs []


label : String -> Button a -> Button a
label label_ button =
    { button | label = label_ }


raised : Bool -> Button a -> Button a
raised raised_ button =
    { button | raised = raised_ }


onClick : a -> Button a -> Button a
onClick onClick_ button =
    { button | onClick = Just onClick_ }


onClickToAttribute : Maybe a -> Maybe (Attribute a)
onClickToAttribute msg =
    Maybe.map (on "click" << Json.Decode.succeed) msg
