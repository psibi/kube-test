{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.HTTP.Types       (status200)
import           Network.Wai              (Application, responseLBS)
import           Network.Wai.Handler.Warp (run)
import Network.HostName
import Data.Monoid ((<>))
import Data.ByteString.Lazy.Char8 (pack)

main :: IO ()
main = do
  hname <- getHostName
  run 3000 (app hname)

app :: String -> Application
app hname _req sendResponse = sendResponse $ responseLBS
    status200
    [("Content-Type", "text/plain")]
    ("Hello Kubernetes " <> pack hname)


