//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

//SCENE TRANSITION
public func transition(nextScene: SKScene, currentScene: SKScene) {
    currentScene.scene?.run(SKAction.fadeOut(withDuration: 1.5)) {
        currentScene.view?.presentScene(nextScene)
    }
}

//SKVIEW
public let myScene = SKView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

//COLORS
public let BACKGROUND_COLOR = SKColor(red: 0 / 255, green: 169 / 255, blue: 159 / 255, alpha: 1)
public let SEROTONIN_COLOR = SKColor(red: 255 / 255, green: 184 / 255, blue: 0 / 255, alpha: 1)
public let DOPAMINE_COLOR = SKColor(red: 216 / 255, green: 71 / 255, blue: 0 / 255, alpha: 1)
public let NORADRENALINE_COLOR = SKColor(red: 8 / 255, green: 85 / 255, blue: 201 / 255, alpha: 1)
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
public let SHELF_NODE_TX = "scene_components/shelf"
public let BACON_NODE_TX = "scene_components/Food/bacon"
public let CHOCOLATE_NODE_TX = "scene_components/Food/chocolate"
public let DONUT_NODE_TX = "scene_components/Food/donut"
public let EGGS_NODE_TX = "scene_components/Food/eggs"
public let FRIES_NODE_TX = "scene_components/Food/fries"
public let SODA_NODE_TX = "scene_components/Food/soda"
public let ARROW_BUTTON_NODE_TX = "scene_components/arrow"

//NODE NAMES
public let BUTTON_NODE_NM = "Next page"
public let BACK_BRAIN_NODE_NM = "Back Brain"
public let FRONT_BRAIN_NODE_NM = "Front Brain"
public let SEROTONIN_BRAIN_NODE_NM = "Serotonin"
public let DOPAMINE_BRAIN_NODE_NM = "Dopamine"
public let NORADRENALINE_BRAIN_NODE_NM = "Noradrenaline"
public let EXERCISE_BUTTON_NODE_NM = "Exercise Button"
public let SLEEP_BUTTON_NODE_NM = "Sleep button"
public let HEALTHY_FOOD_NODE_NM = "Healthy food"
public let UNHEALTHY_FOOD_NODE_NM = "Unhealthy food"

//FONT
public let MAIN_FONT = "SF Pro Text"
public let MAIN_TITLE_SIZE_FONT: CGFloat = 50
public let MAIN_SUBTITLE_SIZE_FONT: CGFloat = 40
public let MAIN_BODY_SIZE_FONT: CGFloat = 35

//TEXT
public var SEROTONIN_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Serotonin", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: SEROTONIN_COLOR]))
public var DOPAMINE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Dopamine", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: DOPAMINE_COLOR]))
public var NORADRENALINE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Noradrenaline", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: NORADRENALINE_COLOR]))
public var EXERCISE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Exercise", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: EXERCISE_COLOR]))
public var DIET_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Diet", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: DIET_COLOR]))
public var SLEEP_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Sleep", attributes: [.font: UIFont.systemFont(ofSize: MAIN_SUBTITLE_SIZE_FONT, weight: .bold), .foregroundColor: SLEEP_COLOR]))

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

public let scaleUp = SKAction.scale(by: 1.5, duration: 0.25)
public let scaleDown = SKAction.scale(by: 0.8, duration: 0.25)
public let scaleSerotoninDown = SKAction.scaleY(to: 0.4, duration: 1.0)
public let scaleDopamineDown = SKAction.scaleY(to: 0.2, duration: 1.0)
public let scaleNoradrenalineDown = SKAction.scaleY(to: 0.3, duration: 1.0)
public let fadeOut = SKAction.fadeOut(withDuration: 0.25)
public let fadeIn = SKAction.fadeIn(withDuration: 0.25)
public let fadeAlphaIn = SKAction.fadeAlpha(to: 1.0, duration: 0.25)
public let fadeAlphaInHalf = SKAction.fadeAlpha(by: 0.5, duration: 0.25)
public let fadeAlphaOut = SKAction.fadeAlpha(to: 0.25, duration: 0.25)
public let unfocus = SKAction.fadeAlpha(to: 0.25, duration: 1)
public let focus = SKAction.fadeAlpha(to: 1, duration: 0.5)
public let moveUp = SKAction.move(to: CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.25)), duration: 0.5)
public let moveToCenter = SKAction.move(to: CGPoint(x: myScene.frame.midX, y: myScene.frame.midY), duration: 0.5)
public let moveToSerotoninSide = SKAction.move(to: CGPoint(x: myScene.frame.maxX + (myScene.frame.width * 0.025), y: myScene.frame.maxY - (myScene.frame.height * 0.16)), duration: 0.75)
public let moveToDopamineSide = SKAction.move(to: CGPoint(x: myScene.frame.minX + (myScene.frame.width * 0.02), y: myScene.frame.maxY - (myScene.frame.height * 0.025)), duration: 0.75)
public let moveToNoradrenalineSide = SKAction.move(to: CGPoint(x: myScene.frame.midX - (myScene.frame.width * 0.275), y: myScene.frame.midY - (myScene.frame.height * 0.55)), duration: 0.75)
