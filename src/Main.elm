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
        , carBreak
        , tweetAt
        , disclaimer
        ]


hero : String -> Html Msg
hero status =
    div
        [ parrallaxBackground "/pitbull-beer2.jpg" ]
        [ h1
            [ class "sparkle"
            , style [ ( "margin", "0" ) ]
            ]
            [ text "Welcome to the Internet" ]
        ]


carBreak : Html Msg
carBreak =
    div
        [ parrallaxBackground "/pitbull-car.jpg" ]
        [ h2 [ class "sparkle" ] [ text "Multiple Cars" ] ]


description : Html Msg
description =
    div
        [ alignCenterStyle ]
        [ img
            [ imageStyle
            , src "/pitbull-zoom.gif"
            ]
            []
        , div [ style [ ( "align-self", "center" ) ] ]
            [ h3 [] [ text "Congratulations!" ]
            , p [] [ text "You successfully located the true World Wide Web" ]
            , p [] [ text "You all get a free car." ]
            ]
        ]


tweetAt : Html Msg
tweetAt =
    div
        [ class "hippy-bg" ]
        [ h2
            [ style
                [ ( "text-align", "center" )
                , ( "margin", "0" )
                , ( "padding-top", "2em" )
                ]
            ]
            [ text "Get a car" ]
        , div [ alignCenterStyle ]
            [ tweet
            , img
                [ class "wobble-element"
                , imageStyle
                , style [ ( "max-height", "400px" ) ]
                , src "/dog.png"
                ]
                []
            ]
        ]

disclaimer : Html Msg
disclaimer =
    div
        [ alignCenterStyle
        , style [ ("background-color", "black")]
        ]
        [ p [] [ text "This is not a real site, please still tweet at Mr. Worldwide though."]]

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


alignCenterStyle : Attribute Msg
alignCenterStyle =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "row" )
        , ( "flex-wrap", "wrap" )
        , ( "justify-content", "center" )
        , ( "align-content", "center" )
        , ( "padding-top", "3em" )
        , ( "padding-bottom", "3em" )
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
