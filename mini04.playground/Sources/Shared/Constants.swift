import Foundation
import CoreGraphics
import SpriteKit

//SCENE TRANSITION
public func transition(nextScene: SKScene, currentScene: SKScene) {
    currentScene.scene?.view?.presentScene(nextScene, transition: .fade(with: BACKGROUND_COLOR, duration: 1.5))
}

//SKVIEW
public let SKVIEW = SKView(frame: CGRect(x: 0, y: 0, width: 700, height: 500))

//COLORS
public let BACKGROUND_COLOR = NSColor(red: 9 / 255, green: 206 / 255, blue: 194 / 255, alpha: 1)
public let SEROTONIN_COLOR = NSColor(red: 226 / 255, green: 205 / 255, blue: 14 / 255, alpha: 1)
public let DOPAMINE_COLOR = NSColor(red: 207 / 255, green: 88 / 255, blue: 29 / 255, alpha: 1)
public let NORADRENALINE_COLOR = NSColor(red: 19 / 255, green: 119 / 255, blue: 207 / 255, alpha: 1)
public let EXERCISE_COLOR = NSColor(red: 121 / 255, green: 19 / 255, blue: 207 / 255, alpha: 1)
public let DIET_COLOR = NSColor(red: 0, green: 130 / 255, blue: 121 / 255, alpha: 1)
public let SLEEP_COLOR = NSColor(red: 213 / 255, green: 140 / 255, blue: 72 / 255, alpha: 1)

//GAME COMPONENTS TEXTURES
public let BACK_BRAIN_NODE_TX = "scene_components/Brain/backBrain"
public let SEROTONIN_NODE_TX = "scene_components/Brain/Serotonin"
public let DOPAMINE_NODE_TX = "scene_components/Brain/Dopamine"
public let NORADRENALINE_NODE_TX = "scene_components/Brain/Noradrenaline"
public let FRONT_BRAIN_NODE_TX = "scene_components/Brain/frontBrain"
public let FULL_BRAIN_NODE_TX = "scene_components/Brain/fullBrain"
public let SHELF_NODE_TX = "scene_components/Food/shelf"
public let BACON_NODE_TX = "scene_components/Food/bacon"
public let CHOCOLATE_NODE_TX = "scene_components/Food/chocolate"
public let DONUT_NODE_TX = "scene_components/Food/donut"
public let EGGS_NODE_TX = "scene_components/Food/eggs"
public let FRIES_NODE_TX = "scene_components/Food/fries"
public let SODA_NODE_TX = "scene_components/Food/soda"
public let ARROW_BUTTON_NODE_TX = "scene_components/arrow"

//NODE NAMES
public let BUTTON_NODE_NM = "Next page"
public let EXERCISE_BUTTON_NODE_NM = "Exercise Button"
public let DIET_BUTTON_NODE_NM = "Diet button"
public let SLEEP_BUTTON_NODE_NM = "Sleep button"

//FONT
public let MAIN_FONT = "SF Symbool"
public let MAIN_BODY_SIZE_FONT: CGFloat = 20

//TEXT
public var SEROTONIN_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Serotonin"
    title.fontColor = SEROTONIN_COLOR
    
    return title
}
public var DOPAMINE_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Dopamine"
    title.fontColor = DOPAMINE_COLOR
    
    return title
}
public var NORADRENALINE_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Noradrenaline"
    title.fontColor = NORADRENALINE_COLOR
    
    return title
}
public var EXERCISE_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Exercices"
    title.fontColor = EXERCISE_COLOR
    
    return title
}
public var DIET_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Diet"
    title.fontColor = DIET_COLOR
    
    return title
}
public var SLEEP_TITLE_TEXT: SKLabelNode {
    let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Semi Bold")
    title.text = "Sleep"
    title.fontColor = SLEEP_COLOR
    
    return title
}

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
