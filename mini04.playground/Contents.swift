//TODO: Documentação

import PlaygroundSupport
import CoreGraphics
import SpriteKit

let skView = SKView(frame: CGRect(x: 0, y: 0, width: 700, height: 500))

let gameScene = GameScene(size: skView.frame.size)

skView.presentScene(gameScene)

gameScene.scaleMode = .aspectFill

PlaygroundSupport.PlaygroundPage.current.liveView = skView
