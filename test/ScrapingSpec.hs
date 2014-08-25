module ScrapingSpec(main, spec) where

import Test.Hspec
import Test.Hspec.Runner
import Scraping

main :: IO ()
main = hspec spec

sampleHtmlString = "<body><div class='a'>ClassA</div><div class='a'><span>SpanInClassA</span></div>"
sampleHtmlStringWithId = "<body><div id='a'>IdA</div><div id='b'><span>IdB</span></div>"

spec = do
    describe "scraper" $ do
      it "gets the immediate text from nodes matching the xpath expression" $ do 
        getValues sampleHtmlString ".a" `shouldBe` ["ClassA"]
      it "matches deeper xpath expressions" $ do 
        getValues sampleHtmlString ".a span" `shouldBe` ["SpanInClassA"]
      it "can get first matching value - useful for ID based xpath expressions" $ do 
        getValues sampleHtmlStringWithId "#a" `shouldBe` ["IdA"]
      it "can get first matching value with deeper expressions - useful for ID based xpath expressions" $ do 
        getFirstMatchingValue sampleHtmlStringWithId "#b span" `shouldBe` "IdB"
      it "returns an empty string if the first matching value is not present" $ do 
        getFirstMatchingValue sampleHtmlStringWithId "#non-existant-span" `shouldBe` ""
