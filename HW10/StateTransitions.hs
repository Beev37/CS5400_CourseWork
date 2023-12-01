-- Write your code after BEGIN CHANGES below

-- We define all the exports for this module
module StateTransitions (
    red_edge_sequence,
    alternating_edge_sequence,
    matching_edge_state_sequence,
    Color (..), Alt (..), Match (..),
    StateName, State, Trans, Path, Network
) where

import Data.List -- for using nub

-- Some useful custom types
data Color  = Red   | Green deriving (Eq, Show) -- Represents red and green colors
data Alt    = Alt   | NoAlt  -- Indicates whether the path should alternate colors or not
data Match  = Match | NoMatch -- Indicates whether state colors must match transition colors
type StateName  = Char -- We'll use characters as state names
type State      = (StateName, Color)  -- A state has a name and a color
type Trans      = (StateName, Color, StateName) -- A transition has two state names and a color
type Path       = [StateName] -- A path is a list of state names
type Network    = ([State], [State], [State], [Trans]) -- A full network: starts, finals, states, transitions

red_edge_sequence :: Network -> [Path]
red_edge_sequence = color_edge_sequence Red NoAlt NoMatch

alternating_edge_sequence :: Network -> [Path]
alternating_edge_sequence nw =
  (color_edge_sequence Green Alt NoMatch nw) ++  -- alternating edge sequences should include
  (color_edge_sequence Red Alt NoMatch nw)       -- those that start with both green and red states

matching_edge_state_sequence :: Network -> [Path]
matching_edge_state_sequence nw =
  (color_edge_sequence Green NoAlt Match nw) ++  -- matching edge state sequences should include
  (color_edge_sequence Red NoAlt Match nw)       -- those that start with both green and red states

-- =============================================================================
-- BEGIN CHANGES: You'll need to implement `color_edge_sequence` and any helper
-- functions necessary. Include all necessary type definitions.

color_edge_sequence :: Color -> Alt -> Match -> Network -> [Path]
color_edge_sequence Red NoAlt NoMatch (strts, fnls, stts, trans) = 
  [pthsFrmStrt | (strtID, _) <- strts, (fnlsID, _) <- fnls, pthsFrmStrt <- res strtID trans fnlsID]

color_edge_sequence Green Alt NoMatch (strts, fnls, stts, trans) = 
  [pthsFrmStrt | (strtID, _) <- strts, (fnlsID, _) <- fnls, pthsFrmStrt <- aes strtID Green trans fnlsID]
color_edge_sequence Red Alt NoMatch (strts, fnls, stts, trans) = 
  [pthsFrmStrt | (strtID, _) <- strts, (fnlsID, _) <- fnls, pthsFrmStrt <- aes strtID Red trans fnlsID]

color_edge_sequence Green NoAlt Match (strts, fnls, stts, trans) =
  [pthsFrmStrt | (strtID, _) <- strts, (fnlsID, _) <- fnls, pthsFrmStrt <- mess strtID Green stts trans fnlsID]
color_edge_sequence Red NoAlt Match (strts, fnls, stts, trans) =
  [pthsFrmStrt | (strtID, _) <- strts, (fnlsID, _) <- fnls, pthsFrmStrt <- mess strtID Red stts trans fnlsID]

res :: StateName -> [Trans] -> StateName -> [Path]
res curr trans fnl
  | curr == fnl = [[fnl]]
  | otherwise = [st1:rest | (st1, edgeClr, st2) <- trans, edgeClr == Red, st1 == curr, rest <- res st2 trans fnl]


aes :: StateName -> Color -> [Trans] -> StateName -> [Path]
aes curr clr trans fnl 
  | curr == fnl = [[fnl]]
  | otherwise = [st1:rest | (st1, edgeClr, st2) <- trans, edgeClr == clr, st1 == curr, rest <- aes st2 (clrSwap clr) trans fnl]

clrSwap :: Color -> Color
clrSwap color
  | color == Red = Green
  | otherwise = Red


mess :: StateName -> Color -> [State] -> [Trans] -> StateName -> [Path]
mess curr clr sts trans fnl 
  | curr == fnl = [[fnl]]
  | otherwise = [st1:rest | (st1, edgeClr, st2) <- trans, edgeClr == clr, st1 == curr, clr == (findClr st1 sts), clr == (findClr st2 sts), rest <- mess st2 clr sts trans fnl] 

findClr :: StateName -> [State] -> Color
findClr node ((stID, clr):sts)
  | (node, clr) == (stID, clr) = clr
  | otherwise = findClr node sts







