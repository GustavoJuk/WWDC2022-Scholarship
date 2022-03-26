//TODO: Documentação

import PlaygroundSupport
import CoreGraphics
import SpriteKit

let gameScene = IntroScene(size: skView.frame.size)

skView.presentScene(gameScene)

PlaygroundSupport.PlaygroundPage.current.liveView = skView
