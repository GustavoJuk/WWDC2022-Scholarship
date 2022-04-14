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
        secondBrain.position = CGPoint(x: myScene.frame.minX + secondBrain.size.width, y: myScene.frame.midY * 0.9)
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
        finishLine.name = "Finish line"
        finishLine.fillColor = .white
        finishLine.physicsBody = SKPhysicsBody(rectangleOf: finishLine.frame.size, center: CGPoint(x: finishLine.frame.midX, y: finishLine.frame.midY))
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
        title.text = "With this in mind, let's help Bruno?"
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    /// Constructor of the introduction to mini game text
    func createText() {
        text.text = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
        text.position = CGPoint(x: myScene.frame.midX, y: title.frame.minY * 0.775)
        text.fontSize = MAIN_SUBTITLE_SIZE_FONT
        text.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        text.numberOfLines = 2
        addChild(text)
    }
    
    /// Constructor of the tutorial text
    func createTutorialText() {
        tutorialText.text = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise"
        tutorialText.position = CGPoint(x: myScene.frame.minX + (myScene.frame.width * 0.45), y: myScene.frame.maxY - (myScene.frame.height * 0.2))
        tutorialText.alpha = 0
        tutorialText.numberOfLines = 3
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        addChild(tutorialText)
    }
}
