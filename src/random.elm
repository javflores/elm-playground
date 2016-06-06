import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model = 
    { dieFace : Int
    }

init : (Model, Cmd Msg)
init =
    (Model 1, Cmd.none)
    
type Msg = Roll

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of
        Roll ->
            (model, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model = 
    div []
        [ h1 [] [ text (toString model.dieFace) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]
