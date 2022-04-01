//TODO: Documentação

import PlaygroundSupport
import SpriteKit
import CoreGraphics

let gameScene = SecondMiniGameScene(size: skView.frame.size)

skView.presentScene(gameScene)

PlaygroundSupport.PlaygroundPage.current.liveView = skView
