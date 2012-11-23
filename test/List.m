
module Data.List 
{
    import stdbool;
    
    type Elem   = Void*;
    type Filter = Void*;
    type Eq     = Void*;
    type Ord    = Void*;
    type Num    = Void*;
    type ListT  = Void*;
    type List   = struct { head : Elem, tail : ListT }*;
            
    nil     : () -> List;
    cons    : (Elem, List) -> List;
    head    : (List) -> Elem;
    tail    : (List) -> List;
    init    : (List) -> List;
    last    : (List) -> Elem;

    empty   : (List) -> Bool;
    lenght  : (List) -> Int;

    reverse : (List) -> List;
    sort    : (Ord, List) -> List;

    reverse         : (List) -> List;
    intersperse     : (Elem, List) -> List;

    transpose       : (List) -> List;
    subsequences    : (List) -> List;
    permutations    : (List) -> List;
    concat          : (List) -> List;
    and             : (List) -> Bool;
    or              : (List) -> Bool;
    any             : (Filter, List) -> Bool;
    all             : (Filter, List) -> Bool;
    sum             : (Num, List) -> Elem;
    product         : (Num, List) -> Elem;
    maximum         : (Ord, List) -> Elem;
    minimum         : (Ord, List) -> Elem;
    // iterate         : (a -> a) -> a -> List;
    repeat          : (Elem) -> List;
    replicate       : (Int, Elem) -> List;
    cycle           : (List) -> List;
    take            : (Int, List) -> List;
    drop            : (Int, List) -> List;
    isPrefixOf      : (Eq, List, List) -> Bool;
    isSuffixOf      : (Eq, List, List) -> Bool;
    isInfixOf       : (Eq, List, List) -> Bool;
    elem            : (Eq, Elem, List) -> Bool;
    notElem         : (Eq, Elem, List) -> Bool;
    // find            : (a -> Bool) -> List -> Maybe a
    // filter          : (a -> Bool) -> List -> List
    // partition       : (a -> Bool) -> List -> (List, List)
    // (!!)            : List -> Int -> a
    // elemIndex       : Eq a => a -> List -> Maybe Int
    // elemIndices     : Eq a => a -> List -> [Int]
    // findIndex       : (a -> Bool) -> List -> Maybe Int
    // findIndices     : (a -> Bool) -> List -> [Int]
    // lines           : String -> [String]
    // words           : String -> [String]
    // unlines         : [String] -> String
    // unwords         : [String] -> String
    // nub             : Eq a => List -> List
    // delete          : Eq a => a -> List -> List
    // sort            : Ord a => List -> List
    // insert          : Ord a => a -> List -> List
    // unionBy         : (a -> a -> Bool) -> List -> List -> List
    // intersectBy     : (a -> a -> Bool) -> List -> List -> List
    // groupBy         : (a -> a -> Bool) -> List -> [List]
    // sortBy          : (a -> a -> Ordering) -> List -> List
    // insertBy        : (a -> a -> Ordering) -> a -> List -> List
    // maximumBy       : (a -> a -> Ordering) -> List -> a
    // minimumBy       : (a -> a -> Ordering) -> List -> a    
}