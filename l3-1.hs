head_ :: String -> String
head_ content = "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content = "<title>" <> content <> "</title>"

makeHtml :: String -> String -> String
makeHtml hs bs = html_ $ head_ $ title_ hs <> body_ bs

html_ :: String -> String
html_ content = "<html>" <> content <> "</html>"

body_ :: String -> String
body_ content = "<body>" <> content <> "</body>"

-- myHtml :: String -> String
-- myHtml = html_ . body_

myHtml :: String
myHtml = makeHtml "My page title" "My page content"

main = putStrLn myHtml
