module Types.Generic where

type XPathExpression = String

class Scrapable a where
    scrapeFromPage :: String -> a
