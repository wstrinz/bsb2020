module Types exposing (Model, Msg(..), Story, initialModel)

import String exposing (String)


type alias Model =
    { count : Int
    , menuOpen : Bool
    , stories : List Story
    }


type Msg
    = Noop
    | Inc
    | SetMenuOpen Bool


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
    }


dummyStories : List Story
dummyStories =
    [ { title = "A Story"
      , feedTitle = "A Feed"
      , content = "<h3>a Content</h3>"
      }
    ]
