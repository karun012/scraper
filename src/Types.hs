module Types where

type XPathExpression = String
type LinkedInUrl = String
type Skill = String
 
data User = User { document :: Maybe String }
data LinkedInProfile = LinkedInProfile { skills :: [Skill], experience :: [Experience] } deriving (Show)
data Experience = Experience { company :: String, position :: String } deriving (Show)

class Scrapable a where
    scrapeFromPage :: String -> a
