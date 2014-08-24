module Scraping (
    getValues,
    getFirstMatchingValue
) where

import Text.HandsomeSoup
import Text.XML.HXT.Core
import Types.Generic

getNodes :: ArrowXml a => XPathExpression -> a XmlTree String
getNodes xpath = css xpath >>> getChildren >>> getText

getValues :: String -> XPathExpression -> [String]
getValues page xpath = runLA (hread >>> getNodes xpath) page

getFirstMatchingValue :: String -> XPathExpression -> String
getFirstMatchingValue page xpath = head $ getValues page xpath
