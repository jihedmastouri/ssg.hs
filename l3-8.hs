import Data.List (foldl')
import Html.Internal

class ToLi a where
  li_ :: a -> Structure

instance ToLi Structure where
  li_ (Structure s) = Structure $ el "li" s

instance ToLi String where
  li_ = Structure . el "li"

ul2_ :: [Structure] -> Structure
ul2_ ((Structure x) : xs) = (\(Structure l) -> Structure $ el "ul" l) $ foldl' (\acc (Structure s) -> append_ acc (li_ s)) (li_ x) xs

ul_ :: [Structure] -> Structure
ul_ = Structure . el "ul" . concatMap ((\(Structure s) -> s) . li_ . (\(Structure s) -> s))

ol_ :: [Structure] -> Structure
ol_ = Structure . el "ol" . concatMap (getStructureString . li_ . getStructureString)

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

main :: IO ()
main = do
  putStrLn $ render $ html_ "hello" (ul_ [p_ "hello", h1_ "world"])
  putStrLn $ render $ html_ "hello" (ol_ [p_ "hello", h1_ "world"])
  putStrLn $ render $ html_ "hello" (ul2_ [p_ "hello", h1_ "world"])
