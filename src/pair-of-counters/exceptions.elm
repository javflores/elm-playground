type Maybe a = Nothing | Just a

type alias User =
    { name : String
    , age: Maybe Int
    }

sue : User
sue = 
    { name = "Sue"
    , age = Nothing
    }

tom : User
tom = 
    { name = "Tom"
    , age = Just 24
    }

alice = User "Alice" (Just 14)

bob = User "Bob" (Just 16)

users = [ sue, tom, alice, bob ]

canBuyAlcohol : User -> Bool
canBuyAlcohol user =
    case user.age of
        Nothing ->
            False

        Just age ->
            age >= 21

getTeenAge : User -> Maybe Int
getTeenAge user =
    case user.age of 
        Nothing -> 
            Nothing

        Just age -> 
            if 13 <= age && age <= 18 then
                Just age

            else
                Nothing

teenAge = List.filterMap getTeenAge users


--Result
type Result error value =
    Err error
    | Ok value

import String
String.toInt "128"
String.toInt "BBB"

view : String -> Html msg
view userInputAge = 
    case String.toInt userInputAge of
        Err msg ->
            span [class "error"] [text msg]

        Ok age ->
            if age < 0 then
                span [class "error"] [text "I bet you are older than that!"]

            else if age > 140 then
                span [class "error"] [text "Seems unlikely..."]

            else
                text "OK!"

