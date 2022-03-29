import Foundation
import CoreGraphics
import SpriteKit

//Scene Transition
public func transition(nextScene: SKScene, currentScene: SKScene) {
    currentScene.scene?.view?.presentScene(nextScene, transition: .fade(with: backGroundColor, duration: 1.5))
}

//SKView Size
public let skView = SKView(frame: CGRect(x: 0, y: 0, width: 700, height: 500))

//Colors
public let backGroundColor = NSColor(red: 9 / 255, green: 206 / 255, blue: 194 / 255, alpha: 1)
public let serotoninColor = NSColor(red: 226 / 255, green: 205 / 255, blue: 14 / 255, alpha: 1)
public let dopamineColor = NSColor(red: 207 / 255, green: 88 / 255, blue: 29 / 255, alpha: 1)
public let noradrenalineColor = NSColor(red: 19 / 255, green: 119 / 255, blue: 207 / 255, alpha: 1)

//Sprite Names
public let backBrainSpriteName = "backBrain"
public let serotoninSpriteName = "Serotonin"
public let dopamineSpriteName = "Dopamine"
public let noradrenalineSpriteName = "Noradrenaline"
public let frontBrainSpriteName = "frontBrain"

//Font
public let mainFontName = "SF Symbool"

//Delay
public func delay(_ delay: Double, closure: @escaping() -> ()) {
    let test = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: test, execute: closure)
}
