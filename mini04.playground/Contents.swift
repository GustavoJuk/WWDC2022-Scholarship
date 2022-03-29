//TODO: Documentação

import PlaygroundSupport
import CoreGraphics
import SpriteKit

let gameScene = FirstScene(size: skView.frame.size)

skView.presentScene(gameScene)

PlaygroundSupport.PlaygroundPage.current.liveView = skView
