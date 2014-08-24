module TestUtilities where

import System.IO
import Control.Monad

readFromFile :: String -> Maybe String
readFromFile filename = toString =<< readFile filename 

toString :: String -> Maybe String
toString "" = Nothing
toString s = Just s
