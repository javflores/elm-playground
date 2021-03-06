import Counter
import Html exposing (..)
import Html.App as App
import Html.Events exposing (onClick)

main =
  App.beginnerProgram
    { model = init 0 0
    , update = update
    , view = view
    }

type alias Model = 
    { topCounter : Counter.Model
    , bottomCounter : Counter.Model
    }

init : Int -> Int -> Model
init top bottom = 
    { topCounter = Counter.init top
    , bottomCounter = Counter.init bottom
    }

type Msg =
    Reset
    | SwapCounters
    | Top Counter.Msg
    | Bottom Counter.Msg

update : Msg -> Model -> Model
update message model =
    case message of 
        Reset ->
            init 0 0

        SwapCounters ->
            { model | topCounter = model.bottomCounter, bottomCounter = model.topCounter }

        Top msg ->
            { model | topCounter = Counter.update msg model.topCounter }

        Bottom msg -> 
            { model | bottomCounter = Counter.update msg model.bottomCounter }

view : Model -> Html Msg
view model = 
    div
        []
        [ App.map Top (Counter.view model.topCounter)
        , App.map Bottom (Counter.view model.bottomCounter)
        , button [ onClick Reset ] [ text "RESET"]
        , button [ onClick SwapCounters ] [ text "SWAP COUNTERS"]
        ]