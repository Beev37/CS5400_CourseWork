 /*
 Exercise  5.1 How does Prolog respond to the following queries?

    X  =  3*4.
        > X = 3*4

    X  is  3*4.
        > X = 12
    
    4  is  X.
        > instantiation error
    
    X  =  Y.
        > X = Y
    
    3  is  1+2.
        > true
    
    3  is  +(1,2).
        > true
    
    3  is  X+2.
        > instantiation error
    
    X  is  1+2.
        > X = 3.
    
    1+2  is  1+2.
        > false 
        %(I thought this would be true, but because the left side is considered a complex 
            % term it can't unify with the evaluated 3 on the right hand side.)
    
    is(X,+(1,2)).
        > X = 3
    
    3+2  =  +(3,2).
        > true
        %(I thought this would be false provided the '1+2 is 1+2' returned false as well. It 
            % seems that the unification only cares about structure of terms and if they match;
            % where as 'is' cares about the structure of the whole clause that needs a variable
            % or singular integer on the left.)
    
    *(7,5)  =  7*5.
        > true
        %(Interestingly enough, the input '*(7,5) = 7*5' yields true, yet '*(7,5) = 5*7' yields false.)
    
    *(7,+(3,2))  =  7*(3+2).
        > true
    
    *(7,(3+2))  =  7*(3+2).
        > true
    
    7*3+2  =  *(7,+(3,2)).
        > false
    
    *(7,(3+2))  =  7*(+(3,2)).
        > true

*/

