module Main exposing (..)

import ElmTest exposing (..)
--import Example
--import ExampleBDD
import ExampleTypeTest

--tests : Test
--tests = 
--    Example.tests

tests : Test
tests = 
    ExampleTypeTest.tests

main : Program Never
main =
    runSuite tests

