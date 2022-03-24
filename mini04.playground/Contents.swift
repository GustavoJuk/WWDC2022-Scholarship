//TODO: Documentação

import PlaygroundSupport
import SpriteKit
import CoreGraphics

let skView = SKView(frame: CGRect(x: 0, y: 0, width: 700, height: 500))

let gameScene = GameScene(size: skView.frame.size)

skView.presentScene(gameScene)

PlaygroundSupport.PlaygroundPage.current.liveView = skView
