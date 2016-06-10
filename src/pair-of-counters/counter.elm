module Counter exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

type alias Model = 
  { counter : Int
  , max : Int
  }

init : Int -> Model
init count =
  { counter = count
  , max = 0
  }  

type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      let 
        next = model.counter + 1
      in  
        if next > model.max then
          {model | counter = next, max = next}
        else
          {model | counter = next, max = model.max}

    Decrement ->
      {model | counter = model.counter - 1}

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    , div [ countStyle ] [ text ("Max: " ++ (toString model.max)) ]
    ]

countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]