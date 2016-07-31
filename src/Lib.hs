{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}

module Lib
    ( run
    ) where

import Web.Spock.Safe
import Data.Monoid
import Data.Text (pack, Text)

helloR :: Path '[Text]
helloR = "hello" <//> var

addR :: Path '[Int, Int]
addR = "calc" <//> var <//> "+" <//> var

run :: IO ()
run = runSpock 8080 $ spockT id $ do
    get root $
        html $ "<a href='" <> renderRoute addR 313 3 <> "'>Calculate 313 + 3</a>"
    get helloR $ \name ->
        text $ "Hello " <> name <> "!"
    get addR $ \a b ->
        text $ pack $ show (a + b)
