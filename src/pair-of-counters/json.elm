--use JSON decode libray to convert JSON into Elm values 
import Json.Decode exposing (..)

decodeString int "42"

decodeString flotat "3.1415"

decodeString bool "true"

decodeString (list string) """["hi", "yo"]"""

--(:=) : String -> Decode a -> Decode a
decodeString ("x" := int) """{ "x": 3, "y": 4 }"""
decodeString ("y" := int) """{ "x": 3, "y": 4 }"""

decodeString object2 (,) ("x" := int) ("y" := int) """{ "x": 3, "y": 4 }"""

type alias User = { name : String, age : Maybe Int }

user = object2 User ("name" := string) (maybe ("age" := int))

decodeString user """{ "name": "Tom", "age": 42 }"""
decodeString user """{ "name": "Sue" }"""

sillyNumber : Decoder Int
sillyNumber =
    oneOf
        [ int
        , customDecoder string String.toInt
        ]


