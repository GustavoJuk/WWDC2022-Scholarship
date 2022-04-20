//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

//SCENE TRANSITION
/// This method creates a transition on the scene in witch is called
/// - Parameters:
///   - nextScene: The next scene
///   - currentScene: The current scene
public func transition(nextScene: SKScene, currentScene: SKScene) {
    currentScene.scene?.run(SKAction.fadeOut(withDuration: 1.5)) {
        currentScene.view?.presentScene(nextScene)
    }
}

//SKVIEW
public let myScene = SKView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

//COLORS
public let BACKGROUND_COLOR = SKColor(red: 0 / 255, green: 169 / 255, blue: 159 / 255, alpha: 1)
public let SEROTONIN_COLOR = SKColor(red: 231 / 255, green: 0 / 255, blue: 138 / 255, alpha: 1)
public let DOPAMINE_COLOR = SKColor(red: 168 / 255, green: 62 / 255, blue: 0 / 255, alpha: 1)
public let NORADRENALINE_COLOR = SKColor(red: 0 / 255, green: 95 / 255, blue: 237 / 255, alpha: 1)
public let EXERCISE_COLOR = SKColor(red: 122 / 255, green: 0 / 255, blue: 63 / 255, alpha: 1)
public let DIET_COLOR = SKColor(red: 99 / 255, green: 33 / 255, blue: 0 / 255, alpha: 1)
public let SLEEP_COLOR = SKColor(red: 2 / 255, green: 51 / 255, blue: 125 / 255, alpha: 1)

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
public let FINISH_LINE_NODE_TX = "scene_components/finishLine"

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
public let MAIN_DEFAULT_SIZE_FONT = UIFont.systemFont(ofSize: 40, weight: .semibold)
public let MAIN_TITLE_SIZE_FONT = UIFont.systemFont(ofSize: 50, weight: .bold)
public let MAIN_BODY_SIZE_FONT = UIFont.systemFont(ofSize: 35, weight: .semibold)

//TEXT
public var SEROTONIN_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Serotonin", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: SEROTONIN_COLOR]))
public var DOPAMINE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Dopamine", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: DOPAMINE_COLOR]))
public var NORADRENALINE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Noradrenaline", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: NORADRENALINE_COLOR]))
public var EXERCISE_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Exercise", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: EXERCISE_COLOR]))
public var DIET_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Diet", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: DIET_COLOR]))
public var SLEEP_TITLE_TEXT = SKLabelNode(attributedText: NSAttributedString(string: "Sleep", attributes: [.font: UIFont.systemFont(ofSize: 40, weight: .bold), .foregroundColor: SLEEP_COLOR]))

//Delay
/// This method serves to delay a block of codes
/// - Parameters:
///   - duration: The delay duration
///   - closure: The block of code in witch will be delayed
public func delay(duration: Double, closure: @escaping() -> ()) {
    let test = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: test, execute: closure)
}

//Collision Types
/// This enum serves to define the collision type of the SKPhysics Body of the nodes
public enum CollisionType: UInt32 {
    public typealias RawValue = UInt32
    
    case brain = 0
    case finishLine = 1
}

//ANIMATIONS
extension SKAction {
    /// This is a custom SKAction in witch makes the node shake in a small arc formation
    /// - Parameters:
    ///   - initialPosition: The initial position in witch the node will start shaking
    ///   - duration: The duration of the animation
    ///   - amplitudeX: The amplitude of the x-axys
    ///   - amplitudeY: The amplitude of the y-axys
    /// - Returns: Returns the sequence of the animation positions
    class func shake(initialPosition:CGPoint, duration:Float, amplitudeX:Int = Int(myScene.frame.width * 0.02), amplitudeY:Int = Int(myScene.frame.height * 0.015)) -> SKAction {
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
public let scaleDown = SKAction.scale(by: 0.8, duration: 0.5)
public let scaleSerotoninDown = SKAction.scaleY(to: 0.25, duration: 1.5)
public let scaleDopamineDown = SKAction.scaleY(to: 0.1, duration: 1.5)
public let scaleNoradrenalineDown = SKAction.scaleY(to: 0.15, duration: 1.5)
public let fadeOut = SKAction.fadeOut(withDuration: 0.25)
public let fadeIn = SKAction.fadeIn(withDuration: 0.25)
public let fadeAlphaIn = SKAction.fadeAlpha(to: 1.0, duration: 0.25)
public let fadeAlphaInHalf = SKAction.fadeAlpha(by: 0.5, duration: 0.25)
public let fadeAlphaOut = SKAction.fadeAlpha(to: 0.25, duration: 0.25)
public let unfocus = SKAction.fadeAlpha(to: 0.25, duration: 0.5)
public let focus = SKAction.fadeAlpha(to: 1, duration: 0.5)
public let moveUp = SKAction.move(to: CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.4), duration: 0.5)
public let moveToCenter = SKAction.move(to: CGPoint(x: myScene.frame.midX, y: myScene.frame.midY), duration: 0.5)
public let moveToSerotoninSide = SKAction.move(to: CGPoint(x: myScene.frame.maxX + (myScene.frame.width * 0.025), y: myScene.frame.maxY - (myScene.frame.height * 0.16)), duration: 0.75)
public let moveToDopamineSide = SKAction.move(to: CGPoint(x: myScene.frame.minX + (myScene.frame.width * 0.02), y: myScene.frame.maxY - (myScene.frame.height * 0.025)), duration: 0.75)
public let moveToNoradrenalineSide = SKAction.move(to: CGPoint(x: myScene.frame.midX - (myScene.frame.width * 0.275), y: myScene.frame.midY - (myScene.frame.height * 0.55)), duration: 0.75)

//TEXTS
public let INTRO_TEXT = "This interactive scene is NOT intended to treat people with depressive symptoms, only to draw attention to the problem, showing in a playful way a layoperson's view of what goes on behind the scenes in our heads."
public let TITLE_TEXT = "That's the human brain"
public let FOOTER_TEXT = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
public let CALL_FOR_ACTION_TEXT = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nMaybe not! And in fact many people ignore their mental health until it becomes a more serious problem. So I wanted to draw attention to one of these problems: Depression!"
public let ARTICLE_TEXT = "Much is discussed about depression and how terrible is... but, do you know what happens exactly?\n\nDepression is classified as a disease because of its symptoms, which affect not only the psychological area, but also the body, since chemical processes take place when a person feels this way.\n\nMost people have a misunderstanding about this issue because it is not a visible thing. Also the same people who judge the victims do not know what is going on inside their minds and bodies."
public let CONTEXT_TEXT = "To sum up, what happens in the brain of a depressed person is the decrease of the neurotransmitters witch are responsable to funcitons like mood regulation, sleep, motivation and energy."
public let FIRST_GAME_TITLE_TEXT = "With this in mind, let's help Bruno?"
public let FIRST_GAME_CONTEXT_TEXT = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
public let FIRST_GAME_TUTORIAL_TEXT = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise!"
public let SECOND_GAME_TUTORIAL_TEXT = "Now let's get the Dopamine that Bruno needs!\nHe must have a balanced Diet!"
public let THIRD_GAME_TUTORIAL_TEXT = "The last part is Bruno's Noradrenaline. Help him getting a good amount of Sleep!"
public let OUTRO_TEXT = "Thanks for playing!"

//SOUNDS
public var sound = SKAction()
/// This enum refers to the audio files
public enum AudioNames: String {
    //MARK: CREDITS = https://www.zapsplat.com/music/game-error-tone-7/
    case SECOND_MG_WRONG_OPTION = "second_mg_wrongOption.mp3"
    //MARK: CREDITS = https://www.zapsplat.com/music/person-eating-toast-crunch-and-chew/
    case SECOND_MG_RIGHT_OPTION = "second_mg_rightOption.m4a"
    //MARK: CREDITS = https://www.zapsplat.com/music/cartoon-grow-expand-increase-whistle-2/
    case THIRD_MG_GROW_EFFECT = "third_mg_grow.mp3"
    //MARK: CREDITS = https://www.zapsplat.com/music/cartoon-falling-whistle-fast/
    case THIRD_MG_DECREASE_EFFECT = "third_mg_decrease.mp3"
}

//HAPTIC FEEDBACK
public let generatorHeavy = UIImpactFeedbackGenerator(style: .heavy)
public let generatorMedium = UIImpactFeedbackGenerator(style: .medium)
