import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import Random

main =
  Html.program
    { init = init, 
    view = view,
    update = update,
    subscriptions = subscriptions
    }

type alias Model = 
    { firstDie : Int
    , secondDie : Int }

init : (Model, Cmd Msg)
init =
    (Model 1 1, Cmd.none)

type Msg = 
    Roll
    | Dice (Int, Int)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of
        Roll ->
            (model, Random.generate Dice (Random.pair (Random.int 1 6) (Random.int 1 6)))

        Dice (firstDie, secondDie) ->
            ({model | firstDie = firstDie, secondDie = secondDie}, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model = 
    div []
        [ h1 [] [ text (toString model.firstDie) ]
        , h1 [] [ text (toString model.secondDie) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]
