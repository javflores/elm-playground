import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import Char

main = 
    Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = 
    { name : String
    , age : String
    , password : String
    , passwordAgain : String    
    }


model : Model
model =
    Model "" "" "" ""

-- UPDATE
type Msg = 
    Name String
    | Age String
    | Password String
    | PasswordAgain String

update : Msg -> Model -> Model
update action model = 
    case action of
        Name name ->
            { model | name = name }

        Age age ->
            { model | age = age }

        Password password ->
            { model | password = password }

        PasswordAgain password -> 
            { model | passwordAgain = password }

-- VIEW
view : Model -> Html Msg
view model = 
    div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "text", placeholder "Age", onInput Age ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model = 
    let 
        (color, message) = 
            if not (List.all Char.isDigit (String.toList model.age)) then
                ("red", "Age must be numeric")

            else if model.password == model.passwordAgain then
                ("green", "OK")

            else if String.length model.password < 8 then
                ("red", "Passwords should be more than 8 chars!")

            else if not (List.any Char.isUpper (String.toList model.password)) then
                ("red", "Password must contain upper case")

            else if not (List.any Char.isLower (String.toList model.password)) then
                ("red", "Password must contain lower case")

            else if not (List.any Char.isDigit (String.toList model.password)) then
                ("red", "Password must contain numeric")

            else
                ("red", "Passwords do not match!")
    in
        div [ style [("color", color)] ] [ text message ]