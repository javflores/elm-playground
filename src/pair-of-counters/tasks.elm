
getStockQuotes =
    Time.now `andThen` \time ->
        Http.getString ("//www.example.com/stocks?time=" ++ toString time)