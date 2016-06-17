module Main exposing (..)

import Html.App
import Messages exposing (Msg(..))
import Players.Commands exposing(fetchAll)
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)


init : (Model, Cmd Msg)
init = 
    ( initialModel , Cmd.map PlayersMsg fetchAll )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }