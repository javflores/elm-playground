import Html exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main = Html.program
    { init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
    }

type alias Model = 
    { topic : String,
    gifUrl : String
    }

init : (Model, Cmd Msg)
init =
    (Model "cats" "waiting.gif", Cmd.none)

type Msg = MorePlease

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        MorePlease -> 
            (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
    div []
        [ h2 [] [text model.topic]
        , img [src model.gifUrl] []
        , button [ onClick MorePlease ] [ text "More Please!"]
        ]