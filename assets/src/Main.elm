module Main exposing (main)

import Browser exposing (Document)
import Components.Button as Button
import Types exposing (Model, Msg(..))


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Flags =
    List String


view : Model -> Document Msg
view _ =
    { title = "BSB 2020"
    , body =
        [ Button.new
            |> Button.raised True
            |> Button.label "Componentized!"
            |> Button.render
        ]
    }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { foo = "oof"
    , bar = "rab"
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
