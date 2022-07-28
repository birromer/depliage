module Main where

import System.Environment (getArgs)

type Id = Int
type Color = Int

data Vertex = Vertex Id Color
  deriving (Show, Read, Eq)

type Simplex = [Vertex]
type SС = [Simplex]

compareVerticesByColor :: Vertex -> Vertex -> Bool
compareVerticesByColor (Vertex _ c1) (Vertex _ c2) = c1 == c2

-- we want the simplices to be correctly colored
isCorrectSimplex :: Simplex -> Bool
isCorrectSimplex = f [] 
  where f _ [] = True
        f seen_so_far ((Vertex _ c):xs) = c `notElem` seen_so_far && f (c:seen_so_far) xs

listOfSimplices :: SС -> [Color] -> [Simplex]
listOfSimplices = undefined

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Hello, Empty!"
    s : ss -> putStrLn ("Hello, " ++ s)
