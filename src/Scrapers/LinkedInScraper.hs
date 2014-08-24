{-# LANGUAGE FlexibleInstances #-}
module Scrapers.LinkedInScraper where

import Types.LinkedInTypes
import Types.Generic
import Scraping
import Data.String.Utils

instance Scrapable Name where
    scrapeFromPage page = uncurry Name $ ((strip $ getFirstMatchingValue page "#name .given-name"), (strip $ getFirstMatchingValue page "#name .family-name"))
instance Scrapable [Skill] where
    scrapeFromPage page = map strip $ getValues page "#profile-skills .competency span"
 
instance Scrapable [Experience] where
    scrapeFromPage page = map (uncurry Experience) $ zip (companies page) (positions page)

instance Scrapable LinkedInProfile where
    scrapeFromPage page = LinkedInProfile { 
                                name = nameScraped,
                                skills = skillsScraped, 
                                experience = experienceScraped 
                            } 
                            where nameScraped = scrapeFromPage page
                                  skillsScraped = scrapeFromPage page
                                  experienceScraped = scrapeFromPage page
companies :: String -> [String]
companies page = map strip $ getValues page "#profile-experience .position .org"

positions :: String -> [String]
positions page = map strip $ getValues page "#profile-experience .position .title"

linkedInprofile :: User -> Maybe LinkedInProfile
linkedInprofile user = case document user of
                         Just doc -> Just (scrapeFromPage doc)
                         Nothing -> Nothing
