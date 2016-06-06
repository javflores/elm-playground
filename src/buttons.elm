import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)

main = Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
-- When writing this program from scratch, I always start by taking a guess at the model. To
-- make a counter, we at least need to keep track of a number that is going up and down. So
-- let's just start with that!
type alias Model = Int

model : Model
model =
 0

-- UPDATE
--Now that we have a model, we need to define how it changes over time. I always start my
--UPDATE section by defining a set of messages that we will get from the UI:

type Msg = Increment | Decrement | Reset

-- I definitely know the user will be able to increment and decrement the counter. The Msg
-- type describes these capabilities as data. Important! From there, the update function just
-- describes what to do when you receive one of these messages.
-- If you get an Increment message, you increment the model. If you get a Decrement
-- message, you decrement the model. Pretty straight-forward stuff.

update : Msg -> Model -> Model
update msg model =
 case msg of
  Increment ->
    model + 1

  Decrement ->
    model - 1

  Reset ->
    0


-- VIEW
-- One thing to notice is that our view function is producing a Html Msg value. This means
-- that it is a chunk of HTML that can produce Msg values. And when you look at the
-- definition, you see the onClick attributes are set to give out Increment and Decrement
-- values. These will get fed directly into our update function, driving our whole app forward.

view : Model -> Html Msg
view model =
 div []
  [ button [ onClick Decrement ] [ text "-" ]
  , div [] [ text (toString model) ]
  , button [ onClick Increment ] [ text "+" ]
  , button [ onClick Reset ] [ text "Reset" ]
  ]
  --Another thing to notice is that div and button are just normal Elm functions. These
  --functions take (1) a list of attributes and (2) a list of child nodes. It is just HTML with slightly
  --different syntax. Instead of having < and > everywhere, we have [ and ] .