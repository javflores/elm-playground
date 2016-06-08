import Html exposing(Html, div, button)
import Html.App as App
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)

main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type alias Model = 
    { time : Time
    , pauseTime : Bool }

init : (Model, Cmd Msg)
init = 
    (Model 0 False, Cmd.none)

type Msg =
    Tick Time
    | Pause

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
    case action of
        Tick newTime ->
            ({model | time = newTime}, Cmd.none)

        Pause ->
            ({model | pauseTime = not model.pauseTime}, Cmd.none)                

subscriptions : Model -> Sub Msg
subscriptions model =
    if model.pauseTime then
        Sub.none
    else
        Time.every second Tick

view : Model -> Html Msg
view model =
    let 
        angle =
            turns (Time.inMinutes model.time)

        handX =
            toString (50 + 40 * cos angle)

        handY =
            toString (50 + 40 * sin angle)
    in
        div []
        [ button [ onClick Pause ] [ text "Pause" ]
        , svg [ viewBox "0 0 100 100", width "300px"]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []
            ]
        ]