module ScrapingSpec(main, spec) where

import Test.Hspec
import Test.Hspec.Runner
import Scraping

main :: IO ()
main = hspec spec

sampleHtmlString = "<body><div class='a'>ClassA</div><div class='a'><span>SpanInClassA</span></div>"

spec = do
    describe "scraper" $ do
      it "gets the immediate text from nodes matching the xpath expression" $ do 
        getValues sampleHtmlString ".a" `shouldBe` ["ClassA"]
      it "matches deeper xpath expressions" $ do 
        getValues sampleHtmlString ".a span" `shouldBe` ["SpanInClassA"]
