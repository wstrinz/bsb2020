module Main exposing (main)

import Browser exposing (Document)
import Html exposing (Html, div, h1, h2, p, text)
import Html.Attributes exposing (style)
import Json.Decode
import Json.Decode.Pipeline exposing (hardcoded, required)
import Material.Button as Button
import Material.Drawer.Dismissible as DismissibleDrawer
import Material.IconButton as IconButton
import Material.LinearProgress as LinearProgress
import Material.List as List
import Material.List.Item as ListItem
import Material.TopAppBar as TopAppBar
import RemoteData
import RemoteData.Http
import Task
import Types exposing (Model, Msg(..), Story, StoryList, initialModel)


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
    { title = "Bsb 2020"
    , body = [ mainBody model ]
    }


mainBody : Model -> Html Msg
mainBody model =
    Html.div
        [ style "display" "flex"
        , style "flex-flow" "row nowrap"
        ]
        [ menuDrawer model
        , mainContent model
        ]


titleBar : Model -> Html Msg
titleBar model =
    TopAppBar.regular TopAppBar.config
        [ TopAppBar.row []
            [ TopAppBar.section [ TopAppBar.alignStart ]
                [ IconButton.iconButton
                    (IconButton.config
                        |> IconButton.setAttributes
                            [ TopAppBar.navigationIcon ]
                        |> IconButton.setOnClick (SetMenuOpen (not model.menuOpen))
                    )
                    "menu"
                , Html.span [ TopAppBar.title ]
                    [ text "Bsb 2020" ]
                ]
            ]
        ]


menuDrawer : Model -> Html Msg
menuDrawer model =
    DismissibleDrawer.drawer (DismissibleDrawer.config |> DismissibleDrawer.setOpen model.menuOpen)
        [ DismissibleDrawer.content []
            [ List.list List.config
                (ListItem.listItem ListItem.config
                    [ text "Feeds" ]
                )
                [ ListItem.listItem ListItem.config
                    [ text "Line item" ]
                ]
            ]
        ]


mainContent : Model -> Html Msg
mainContent model =
    Html.div [ DismissibleDrawer.appContent ]
        [ titleBar model
        , Html.div
            [ TopAppBar.fixedAdjust ]
            [ Button.raised
                (Button.config |> Button.setOnClick FetchStories)
                ("Fetch " ++ String.fromInt (List.length model.stories))
            , storiesView model
            ]
        ]


storiesView : Model -> Html Msg
storiesView model =
    case model.storiesRemoteData of
        RemoteData.Success _ ->
            Html.div [] <| List.map storyView model.stories

        _ ->
            LinearProgress.indeterminate LinearProgress.config


storyView : Story -> Html Msg
storyView story =
    div []
        [ h1 [] [ text story.title ]
        , h2 [] [ text story.feedTitle ]
        , p [] [ text story.content ]
        ]


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Task.succeed FetchStories |> Task.perform (\x -> x) )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        Inc ->
            ( { model | count = model.count + 1 }, Cmd.none )

        SetMenuOpen isOpen ->
            ( { model | menuOpen = isOpen }, Cmd.none )

        FetchStories ->
            ( { model | storiesRemoteData = RemoteData.Loading }
            , RemoteData.Http.get "/stories" FetchStoriesResponse storiesDecoder
            )

        FetchStoriesResponse stories ->
            case stories of
                RemoteData.Success storyList ->
                    ( { model | stories = storyList, storiesRemoteData = stories }, Cmd.none )

                _ ->
                    ( { model | storiesRemoteData = stories }, Cmd.none )


storiesDecoder : Json.Decode.Decoder StoryList
storiesDecoder =
    Json.Decode.field "data" (Json.Decode.list storyDecoder)


storyDecoder : Json.Decode.Decoder Story
storyDecoder =
    Json.Decode.succeed Story
        |> required "title" Json.Decode.string
        |> hardcoded "fake feed title"
        |> required "content" Json.Decode.string


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
