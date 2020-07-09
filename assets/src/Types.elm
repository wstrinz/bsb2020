module Types exposing (Model, Msg(..))


type alias Model =
    { foo : String
    , bar : String
    }


type Msg
    = Noop
