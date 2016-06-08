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
        minutesAngle =
            turns (Time.inMinutes model.time)

        hoursAngle =
            turns (Time.inHours model.time)

        handXMinutes =
            toString (50 + 40 * cos minutesAngle)

        handXHours =
            toString (50 + 40 * cos hoursAngle)

        handYMinutes =
            toString (50 + 40 * sin minutesAngle)

        handYHours =
            toString (50 + 40 * sin hoursAngle)
    in
        div []
        [ button [ onClick Pause ] [ text "Pause" ]
        , svg [ viewBox "0 0 100 100", width "300px"]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 handXMinutes, y2 handYMinutes, stroke "#023963" ] []
            , line [ x1 "50", y1 "50", x2 handXHours, y2 handYHours, stroke "#023963" ] []
            ]
        ]