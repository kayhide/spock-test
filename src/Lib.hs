{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( run
    ) where

import Data.Monoid
import Web.Spock.Safe

run :: IO ()
run = runSpock 8080 $ spockT id $ do
    get root $
        text "Hello World!"
    get ("hello" <//> var) $ \name ->
        text $ "Hello " <> name <> "!"
