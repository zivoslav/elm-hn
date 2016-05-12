module Styles exposing
    ( Class(..)
    , css
    )

import Css

{-| CSS selector classes. -}
type Class
    = Story
    | Title
    | Info
    | Comment

{-| Final, rendered CSS <style> tag. -}
css : Css.Css x Class msg
css = Css.css styles

{-| All the styles in the CSS. -}
styles : List (Css.Style a Class)
styles = 
    [ storyStyle
    , titleStyle
    , infoStyle
    , linkStyle
    , linkHoverStyle
    ]

{-| A story div style. -}
storyStyle : Css.Style a Class
storyStyle =
    { selector = [ Css.Class Story ]
    , descriptor =
        [ ("margin", "0")
        , ("padding", "12px 30px")
        , ("background-color", "#fff")
        , ("font-family", "Arial, Helvetica")
        , ("border-top", "1px solid #eee")
        ]
    }

{-| The title of the story. -}
titleStyle : Css.Style a Class
titleStyle =
    { selector = [ Css.Class Title ]
    , descriptor =
        [ ("font-size", "16px")
        , ("margin-bottom", "6px")
        , ("overflow", "hidden")
        , ("text-overflow", "ellipsis")
        , ("white-space", "nowrap")
        ]
    }

{-| The posted by span. -}
infoStyle : Css.Style a Class
infoStyle =
    { selector = [ Css.Class Info ]
    , descriptor =
        [ ("font-size", "12px")
        , ("color", "#aaa")
        ]
    }

{-| All links. -}
linkStyle : Css.Style a Class
linkStyle =
    { selector = [ Css.Element "a" ]
    , descriptor =
        [ ("color", "#d73")
        , ("text-decoration", "none")
        ]
    }

{-| Link style when hovering over it. -}
linkHoverStyle : Css.Style a Class
linkHoverStyle =
    { selector = [ Css.Pseudo [ Css.Hover ] (Css.Element "a") ]
    , descriptor =
        [ ("text-decoration", "underline")
        ]
    }