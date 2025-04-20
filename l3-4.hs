newtype Html = Html String

newtype Structure = Structure String

getStructureString :: Structure -> String
getStructureString (Structure s) = s

p_ = Structure . el "p"

el :: String -> String -> String
el tag content =
  "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

-- or: append_ a b = Structure (getStructureString a <> getStructureString b)

type Title = String

newtype HtmlHead = HtmlHead Title

render :: Html -> String
render (Html s) = s

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el
        "html"
        ( el "head" (el "title" title)
            <> el "body" (getStructureString content)
        )
    )

h1_ :: String -> Structure
h1_ = Structure . el "h1"

myhtml :: Html
myhtml =
  html_
    "My title"
    ( append_
        (h1_ "Heading")
        ( append_
            (p_ "Paragraph #1")
            (p_ "Paragraph #2")
        )
    )

main :: IO ()
main = putStrLn (render myhtml)
