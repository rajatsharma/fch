module Main where

import System.Environment (getArgs)
import System.Process (runCommand)

main :: IO ()
main = do
  args <- getArgs
  let branchName = head args
  runCommand $ "git fetch origin/" <> branchName
  runCommand $ "git checkout " <> branchName
  pure ()
