module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    { status : String
    }


init : ( Model, Cmd Msg )
init =
    ( { status = "Welcome to the Internet" }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ hero model.status
        , description
        , tweetAt
        ]


hero : String -> Html Msg
hero status =
    div
        [ parrallaxBackground "/pitbull-beer.jpg" ]
        [ h1 [ style [ ( "margin", "0" ) ] ] [ text "Mr. Worldwide Web" ]
        , h3 [] [ text status ]
        , p [] [ text "Congratulations, you successfully located the true World Wide Web" ]
        ]


description : Html Msg
description =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "row" )
            , ( "flex-wrap", "wrap" )
            , ( "justify-content", "center" )
            , ( "align-content", "center" )
            ]
        ]
        [ img
            [ imageStyle
            , src "/pitbull-zoom.gif"
            ]
            []
        , div [ style [ ( "align-self", "center" ) ] ]
            [ h3 [] [ text "Good job Everyone!" ]
            , p [] [ text "You all get a free car." ]
            ]
        ]


tweetAt : Html Msg
tweetAt =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "row" )

            -- , ("flex-wrap", "wrap")
            , ( "justify-content", "center" )
            , ( "align-content", "center" )
            , ( "background-color", "#7DBC9F" )
            ]
        ]
        [ tweet
        , img
            [ imageStyle
            , style [ ( "max-height", "400px" ) ]
            , src "/dog.png"
            ]
            []
        ]


imageStyle : Attribute Msg
imageStyle =
    style
        [ ( "border-radius", "2em" )
        , ( "margin", "1em" )
        ]


parrallaxBackground : String -> Attribute Msg
parrallaxBackground imgPath =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "flex-wrap", "wrap" )
        , ( "justify-content", "center" )
        , ( "align-content", "flex-end" )
        , ( "margin", "0em" )
        , ( "width", "100%" )
        , ( "height", "500px" )
        , ( "background-size", "cover" )
        , ( "background-image", "url(" ++ imgPath ++ ")" )
        , ( "background-position", "center" )
        , ( "background-attachment", "fixed" )
        , ( "background-repeat", "no-repeat" )
        ]


tweet : Html Msg
tweet =
    a
        [ class "twitter-share-button"
        , href "https://twitter.com/intent/tweet?text=I%20want%20want%20my%20free%20car%20%40pitbull"
        , style
            [ ( "color", "white" )
            , ( "align-self", "center" )
            , ( "background-color", "#1DA1F2" )
            , ( "padding", "1em" )
            , ( "border-radius", ".5em" )
            , ( "max-height", "3em" )
            ]
        ]
        [ text "Tweet" ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
