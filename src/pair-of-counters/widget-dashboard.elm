--Takeaways:
--  Solve each subproblem first.
--  Use union types to put together all the solutions.
--  Creating a union type generates a bunch of constructors.
--  These constuctors tag data so that we can differentiate it at runtime.
--  A case expression lets us tear data apart based on these tags.


type alias LogsInfo =
    { logs : List String
    }

type alias TimeInfo =
    { events : List (Time, Float)
    , yAxis : String
    }

type alias ScatterInfo =
    { points : List (Float, Float)
    , xAxis : String
    , yAxis : String
    }

type Widget = Logs LogsInfo 
                | TimePlot TimeInfo 
                | ScatterPlot ScatterInfo


view : Widget -> Html msg
view widget =
    case widget of
        Logs logsInfo ->
            viewLogs logsInfo

        TimePlot timeInfo ->
            viewTime timeInfo

        ScatterPlot scatterInfo ->
            viewScatter scatterInfo