% Canvas Exercise: 1

neighbor_left(clock, rocket).
neighbor_left(rocket, guitar).
neighbor_left(guitar, phone).

neighbor_top(paperclip, clock).
neighbor_top(scissors, guitar).

neighbor_right(rocket, clock).
neighbor_right(guitar, rocket).
neighbor_right(phone, guitar).

neighbor_bottom(clock, paperclip).
neighbor_bottom(guitar, scissors).


% Below 2 lines are my attempts at describing left_of() that can determine whether an object is to the left of another
% regardless of what row they are located in. However, this implementation results in an infinite loop after finding
% the initial answer. This loop prevents it from being useful to both "above()" and "below()".
        % left_of(X,Y):- neighbor_left(X,Y).
        % left_of(X,Y):- (neighbor_left(X,Z); neighbor_bottom(X,Z); neighbor_top(X,Z)), left_of(Z,Y).

left_of(X,Y):- neighbor_left(X,Y).
left_of(X,Y):- (neighbor_left(X,Z); neighbor_top(X,Z)), left_of(Z,Y).

% Below 2 lines are my attempts at describing right_of() that can determine whether an object is to the right of another
% regardless of what row they are located in. However, this implementation results in an infinite loop after finding
% the initial answer. This loop prevents it from being useful to both "above()" and "below()".
        % right_of(X,Y):- neighbor_right(X,Y).
        % right_of(X,Y):- (neighbor_right(X,Z); neighbor_bottom(X,Z); neighbor_top(X,Z)), right_of(Z,Y).

right_of(X,Y):- neighbor_right(X,Y).
right_of(X,Y):- (neighbor_right(X,Z); neighbor_top(X,Z)), right_of(Z,Y).

above(X,Y):- neighbor_top(X,Y).
above(X,Y):- neighbor_top(X,Z), (left_of(Z,Y); right_of(Z,Y)).

below(X,Y):- neighbor_bottom(X,Y).
below(X,Y):- neighbor_bottom(X,Z), (left_of(Z,Y); right_of(Z,Y)).