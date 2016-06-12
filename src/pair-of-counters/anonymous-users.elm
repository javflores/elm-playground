type User = Anonymous | Named String

activeUsers : List User
activeUsers =
    [ Anonymous, Named "catface420", Named "AzureDiamond", Anonymous ]

userPhoto : User -> String
userPhoto user = 
    case user of 
        Anonymous ->
            "anon.png"

        Named name ->
            "users/" ++ name ++ ".png"

photos : List String
photos =
    List.map userPhoto activeUsers