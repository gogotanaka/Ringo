module Main where

import Ringo.SKICore

import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.HUnit

skiTests :: [Test]
skiTests = [ "SKI 1" ~: 
               I ~=? I

           , "SKI 2" ~: 
               S $> K $> K $> I~=? I
           ]

main :: IO ()
main = do
     defaultMain $ hUnitTestToTests $ TestList skiTests
