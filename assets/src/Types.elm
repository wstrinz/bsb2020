module Types exposing (Model, Msg(..))


type alias Model =
    { count : Int
    , menuOpen : Bool
    }


type Msg
    = Noop
    | Inc
    | SetMenuOpen Bool
