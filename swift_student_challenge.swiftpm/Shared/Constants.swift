//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

//SCENE TRANSITION
public func transition(nextScene: SKScene, currentScene: SKScene) {
    currentScene.scene?.view?.presentScene(nextScene, transition: .fade(with: BACKGROUND_COLOR, duration: 1.5))
}

//SKVIEW
public let MYVIEW = SKView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

//COLORS
public let BACKGROUND_COLOR = SKColor(red: 9 / 255, green: 206 / 255, blue: 194 / 255, alpha: 1)
public let SEROTONIN_COLOR = SKColor(red: 226 / 255, green: 205 / 255, blue: 14 / 255, alpha: 1)
public let DOPAMINE_COLOR = SKColor(red: 207 / 255, green: 88 / 255, blue: 29 / 255, alpha: 1)
public let NORADRENALINE_COLOR = SKColor(red: 19 / 255, green: 119 / 255, blue: 207 / 255, alpha: 1)
public let EXERCISE_COLOR = SKColor(red: 121 / 255, green: 19 / 255, blue: 207 / 255, alpha: 1)
public let DIET_COLOR = SKColor(red: 0, green: 130 / 255, blue: 121 / 255, alpha: 1)
public let SLEEP_COLOR = SKColor(red: 213 / 255, green: 140 / 255, blue: 72 / 255, alpha: 1)

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
public let SLEEP_BUTTON_NODE_NM = "Sleep button"
public let HEALTHY_FOOD_NODE_NM = "Healthy food"
public let UNHEALTHY_FOOD_NODE_NM = "Unhealthy food"

//FONT
public let MAIN_FONT = "SF Symbool"
public let MAIN_SUBTITLE_SIZE_FONT: CGFloat = 23
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

//ANIMATIONS
extension SKAction {
    class func shake(initialPosition:CGPoint, duration:Float, amplitudeX:Int = 12, amplitudeY:Int = 3) -> SKAction {
        let startingX = initialPosition.x
        let startingY = initialPosition.y
        let numberOfShakes = duration / 0.015
        var actionsArray:[SKAction] = []
        for _ in 1...Int(numberOfShakes) {
            let newXPos = startingX + CGFloat(arc4random_uniform(UInt32(amplitudeX))) - CGFloat(amplitudeX / 2)
            let newYPos = startingY + CGFloat(arc4random_uniform(UInt32(amplitudeY))) - CGFloat(amplitudeY / 2)
            actionsArray.append(SKAction.move(to: CGPoint(x: newXPos, y: newYPos), duration: 0.015))
        }
        actionsArray.append(SKAction.move(to: initialPosition, duration: 0.015))
        return SKAction.sequence(actionsArray)
    }
}

public let scaleUp = SKAction.scale(by: 2.0, duration: 0.25)
public let scaleSerotoninDown = SKAction.scale(by: 0.5, duration: 1.0)
public let scaleDopamineDown = SKAction.scale(by: 0.2, duration: 1.0)
public let scaleNoradrenalineDown = SKAction.scale(by: 0.3, duration: 1.0)
public let fadeOut = SKAction.fadeOut(withDuration: 0.25)
public let fadeIn = SKAction.fadeIn(withDuration: 0.25)
public let fadeAlphaUp = SKAction.fadeAlpha(to: 1.0, duration: 0.25)
public let fadeAlphaInHalf = SKAction.fadeAlpha(by: 0.5, duration: 0.25)
public let fadeAlphaOut = SKAction.fadeAlpha(to: 0.25, duration: 0.25)
public let moveToCenter = SKAction.move(to: CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY), duration: 0.5)
public let moveToSerotoninSide = SKAction.move(to: CGPoint(x: MYVIEW.frame.maxX - 10, y: MYVIEW.frame.maxY - 70), duration: 0.75)
public let moveToDopamineSide = SKAction.move(to: CGPoint(x: MYVIEW.frame.minX + 20, y: MYVIEW.frame.maxY - 50), duration: 0.75)
public let moveToNoradrenalineSide = SKAction.move(to: CGPoint(x: MYVIEW.frame.midX / 3, y: MYVIEW.frame.minY - 20), duration: 0.75)
