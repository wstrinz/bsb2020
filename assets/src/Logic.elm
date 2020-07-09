module Logic exposing (appendWhen)


appendWhen : Bool -> a -> List a -> List a
appendWhen pred newItem list =
    if pred then
        list ++ [ newItem ]

    else
        list
