module Main where

import LinkedInScraper
import Types
import Http
import Control.Applicative ((<$>))
import Safe (headMay)
import System.Environment (getArgs)

main :: IO ()
main = putStrLn =<< show <$> linkedInprofile <$> User <$> (getPage =<< getUrl <$> getArgs)
 
getUrl :: [String] -> LinkedInUrl
getUrl = maybe "" id . headMay
