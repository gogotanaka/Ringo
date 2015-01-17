module Main where

import Ringo
import Ringo.SKICore
import Ringo.Parser

import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.HUnit

skiTests :: [Test]
skiTests = [ "SKI 1" ~: 
               I ~=? I

           , "SKI 2" ~: 
               S $> K $> K $> I~=? I

           , "Ringo.eval ex1" ~:
               eval "hhs" ~=? "S"

           ]

main :: IO ()
main = do
     defaultMain $ hUnitTestToTests $ TestList skiTests
