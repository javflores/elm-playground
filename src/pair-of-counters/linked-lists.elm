type IntList = Empty | Node Int IntList

type List a = Empty | Node a (List a)

sumInt : IntList -> Int
sumInt list =
    case list of
        Empty ->
            0

        Node number next ->
            number + sumInt next
