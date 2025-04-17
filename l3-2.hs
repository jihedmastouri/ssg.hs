el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

makeHtml :: String -> String -> String
makeHtml = \hs bs -> (html_ $ head_ $ title_ hs <> body_ bs) -- for the fun of it

myHtml :: String
myHtml = makeHtml "My page title" (h1_ "My page content" <> p_ "Hello, world!")

main :: IO ()
main = putStrLn myHtml
