module Main where

import Scrapers.LinkedInScraper
import Types.LinkedInTypes
import Types.Generic
import Http
import Control.Applicative ((<$>))
import Safe (headMay)
import System.Environment (getArgs)

main :: IO ()
main = putStrLn =<< show <$> linkedInprofile <$> User <$> (getPage =<< getUrl <$> getArgs)
 
getUrl :: [String] -> LinkedInUrl
getUrl = maybe "" id . headMay
