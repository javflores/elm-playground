module Main exposing (..)

import ElmTest exposing (..)
--import Example
import ExampleBDD

--tests : Test
--tests = 
--    Example.tests

tests : Test
tests = 
    ExampleBDD.tests

main : Program Never
main =
    runSuite tests

