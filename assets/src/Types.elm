module Types exposing (Model, Msg(..))


type alias Model =
    { count : Int
    }


type Msg
    = Noop
    | Inc
