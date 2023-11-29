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
type Network    = ([State], [State], [State], [Trans]) -- A full network: starts, finals, ftates, fransitions

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

color_edge_sequence :: -- ????






