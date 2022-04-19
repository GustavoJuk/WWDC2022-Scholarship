//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension FirstMiniGameScene {
    
    /// Constructor of the second brain
    func addFullBrainNode() {
        secondBrain.name = FULL_BRAIN_NODE_TX
        secondBrain.scale(to: CGSize(width: myScene.frame.width * 0.2 - (secondBrain.frame.width * 0.15), height: myScene.frame.height * 0.2))
        secondBrain.position = CGPoint(x: myScene.frame.minX + secondBrain.size.width, y: myScene.frame.midY * 1.2)
        secondBrain.alpha = 0
        secondBrain.scene?.backgroundColor = .gray
        secondBrain.physicsBody = SKPhysicsBody(texture: secondBrain.texture!, size: secondBrain.size)
        secondBrain.physicsBody?.affectedByGravity = false
        secondBrain.physicsBody?.allowsRotation = false
        secondBrain.physicsBody?.categoryBitMask = CollisionType.brain.rawValue
        secondBrain.physicsBody?.collisionBitMask = CollisionType.finishLine.rawValue
        secondBrain.physicsBody?.contactTestBitMask = CollisionType.finishLine.rawValue
        
        addChild(secondBrain)
    }
    
    /// Constructor of the Exercise button
    func addButtonNode() {
        exerciseButton.addButton(skScene: self)
        exerciseButton.alpha = 0
    }
    
    /// Constructor of the finish line
    func addFinishLine() {
        finishLine.scale(to: CGSize(width: myScene.frame.width * 0.2125 - (finishLine.frame.height * 0.7875), height: myScene.frame.height * 0.3))
        finishLine.position = CGPoint(x: myScene.frame.maxX - (myScene.frame.midX * 0.3), y: secondBrain.position.y)
        finishLine.name = "Finish line"
        finishLine.physicsBody = SKPhysicsBody(rectangleOf: finishLine.frame.size)
        finishLine.physicsBody?.allowsRotation = false
        finishLine.physicsBody?.affectedByGravity = false
        finishLine.physicsBody?.categoryBitMask = CollisionType.finishLine.rawValue
        
        addChild(finishLine)
    }
    
    /// Constructor of the first brain
    func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.6)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    /// Constructor of the title text
    func createTitle() {
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        addChild(title)
    }
    
    /// Constructor of the introduction to mini game text
    func createText() {
        text.position = CGPoint(x: myScene.frame.midX, y: title.frame.minY * 0.775)
        text.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        text.numberOfLines = 2
        addChild(text)
    }
    
    /// Constructor of the tutorial text
    func createTutorialText() {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: FIRST_GAME_TUTORIAL_TEXT, attributes: [.font: MAIN_BODY_SIZE_FONT, .foregroundColor: SKColor.white]))
        attributedText.addAttributes([.foregroundColor: SEROTONIN_COLOR], range: attributedText.mutableString.range(of: "Serotonin"))
        attributedText.addAttributes([.foregroundColor: EXERCISE_COLOR], range: attributedText.mutableString.range(of: "Exercise"))
        tutorialText.attributedText = attributedText
        tutorialText.position = CGPoint(x: myScene.frame.minX + (myScene.frame.width * 0.45), y: myScene.frame.maxY - (myScene.frame.height * 0.2))
        tutorialText.alpha = 0
        tutorialText.numberOfLines = 3
        tutorialText.preferredMaxLayoutWidth = myScene.frame.width - 70
        addChild(tutorialText)
    }
}
