module Types.LinkedInTypes where

type LinkedInUrl = String
type Skill = String
 
data User = User { document :: Maybe String }

data Name = Name { firstName :: String, lastName :: String} deriving (Show)
data LinkedInProfile = LinkedInProfile { 
    name :: Name,
    skills :: [Skill], 
    experience :: [Experience] 
} deriving (Show)
data Experience = Experience { company :: String, position :: String } deriving (Show)

