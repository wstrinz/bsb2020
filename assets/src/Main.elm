module Main exposing (main)

import Browser exposing (Document)
import Components.Button as BSBButton
import Material.Button as Button
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
view model =
    { title = "BSB 2020"
    , body =
        [ Button.raised
            (Button.config |> Button.setOnClick Inc)
            ("Counter is " ++ String.fromInt model.count)
        ]
    }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { count = 0
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        Inc ->
            ( { model | count = model.count + 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
