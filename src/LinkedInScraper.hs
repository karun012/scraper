{-# LANGUAGE FlexibleInstances #-}
module LinkedInScraper where

import Types
import Scraping

instance Scrapable [Skill] where
    scrapeFromPage page = getValues page "#profile-skills .competency span"
 
instance Scrapable [Experience] where
    scrapeFromPage page = map (uncurry Experience) $ zip (companies page) (positions page)

instance Scrapable LinkedInProfile where
    scrapeFromPage page = LinkedInProfile { skills = skillsScraped, experience = experienceScraped } 
                            where skillsScraped = scrapeFromPage page
                                  experienceScraped = scrapeFromPage page
companies :: String -> [String]
companies page = getValues page "#profile-experience .position .org"

positions :: String -> [String]
positions page = getValues page "#profile-experience .position .title"

linkedInprofile :: User -> Maybe LinkedInProfile
linkedInprofile user = case document user of
                         Just doc -> Just (scrapeFromPage doc)
                         Nothing -> Nothing
