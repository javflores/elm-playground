module ExampleBDD exposing (..)

import ElmTestBDDStyle exposing (..)


tests : Test
tests =
    describe "A Test Suite"
        [ it "adds two numbers"
            <| expect (3 + 7) toBe 10
        , it "fails for non-sense stuff"
            <| expect True toBe True
        ]