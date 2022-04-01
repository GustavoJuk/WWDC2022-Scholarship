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
public let exercisesColor = NSColor(red: 121 / 255, green: 19 / 255, blue: 207 / 255, alpha: 1)
public let dietColor = NSColor(red: 0, green: 130 / 255, blue: 121 / 255, alpha: 1)
public let sleepColor = NSColor(red: 213 / 255, green: 140 / 255, blue: 72 / 255, alpha: 1)

//Names
public let backBrainSpriteName = "scene_components/Brain/backBrain"
public let serotoninSpriteName = "scene_components/Brain/Serotonin"
public let dopamineSpriteName = "scene_components/Brain/Dopamine"
public let noradrenalineSpriteName = "scene_components/Brain/Noradrenaline"
public let frontBrainSpriteName = "scene_components/Brain/frontBrain"
public let fullBrainSpriteName = "scene_components/Brain/fullBrain"
public let shelfSpriteName = "scene_components/Food/shelf"
public let baconSpriteName = "scene_components/Food/bacon"
public let chocolateSpriteName = "scene_components/Food/chocolate"
public let donutSpriteName = "scene_components/Food/donut"
public let eggsSpriteName = "scene_components/Food/eggs"
public let firesSpriteName = "scene_components/Food/fries"
public let sodaSpriteName = "scene_components/Food/soda"
public var serotoninNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = serotoninSpriteName
    title.fontColor = serotoninColor
    
    return title
}
public var dopamineNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = dopamineSpriteName
    title.fontColor = dopamineColor
    
    return title
}
public var noradrenalineNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = noradrenalineSpriteName
    title.fontColor = noradrenalineColor
    
    return title
}
public var exercicesNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = "Exercices"
    title.fontColor = exercisesColor
    
    return title
}
public var dietNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = "Diet"
    title.fontColor = dietColor
    
    return title
}
public var sleepNameTitle: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    title.text = "Sleep"
    title.fontColor = sleepColor
    
    return title
}
public let buttonNodeName = "Next page"
public let buttonSpriteName = "scene_components/arrow"
public let exerciseButtonNodeName = "Exercise Button"
public let dietButtonNodeName = "Diet button"
public let sleepButtonNodeName = "Sleep button"

//Font
public let mainFontName = "SF Symbool"

//Delay
public func delay(_ delay: Double, closure: @escaping() -> ()) {
    let test = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: test, execute: closure)
}

//Collision Types
public enum CollisionType: UInt32 {
    public typealias RawValue = UInt32
    
    case brain = 0
    case finishLine = 1
}
