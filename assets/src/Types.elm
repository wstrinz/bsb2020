module Types exposing (Model, Msg(..), Story, StoryList, dummyStories, initialModel)

import RemoteData exposing (RemoteData(..), WebData)
import String exposing (String)


type alias Model =
    { count : Int
    , menuOpen : Bool
    , stories : List Story
    , storiesRemoteData : WebData StoryList
    }


type Msg
    = Noop
    | Inc
    | SetMenuOpen Bool
    | FetchStories
    | FetchStoriesResponse (WebData StoryList)


type alias StoryList =
    List Story


type alias Story =
    { title : String
    , feedTitle : String
    , content : String
    }


initialModel : Model
initialModel =
    { count = 0
    , menuOpen = False
    , stories = dummyStories
    , storiesRemoteData = RemoteData.NotAsked
    }


dummyStories : List Story
dummyStories =
    [ { title = "A Story"
      , feedTitle = "A Feed"
      , content = "<h3>a Content</h3>"
      }
    ]
