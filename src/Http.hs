module Http where

import Network.HTTP (simpleHTTP, getRequest, getResponseBody)
import Network.URI 
import Control.Monad.Maybe
import Control.Monad.Trans

getPage :: String -> IO (Maybe String)
getPage url = runMaybeT $ liftIO $ getResponseBody =<< (simpleHTTP . getRequest) url

