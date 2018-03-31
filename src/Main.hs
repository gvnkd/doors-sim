module Main where

import System.Random

iters :: Int
iters = 10000

roll :: IO Int
roll = getStdRandom (randomR (1,3))

change :: Int -> Int -> Int
change a b =
    case a == b of
      True -> case a of
                1 -> 2
                2 -> 1
                3 -> 1
      False -> a

main :: IO ()
main = do
  ns <- mapM (\x -> do
                 a <- roll
                 b <- roll
                 return (a,b, change a b)
             ) [0..iters]
  let res =  map (\(a, b, c) -> (a==b, a==c)) ns
      rawWins = length $ filter (\(a,b) -> a) res
      changeWins = length $ filter (\(a,b) -> b) res
  print rawWins
  print changeWins
