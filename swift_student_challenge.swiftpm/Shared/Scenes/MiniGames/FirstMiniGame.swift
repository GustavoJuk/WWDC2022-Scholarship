//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class FirstMiniGameScene: SKScene, SKPhysicsContactDelegate {
    
    private let title = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let text = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let finishLine = SKShapeNode(rect: CGRect(origin: CGPoint(x: myScene.frame.maxX - (myScene.frame.midX * 0.275), y: myScene.frame.midY * 0.65), size: CGSize(width: myScene.bounds.width * 0.025, height: myScene.bounds.height * 0.25)))
    private let brain = Brain()
    private let secondBrain = SKSpriteNode(imageNamed: FULL_BRAIN_NODE_TX)
    private let nextSceneButton = NextSceneButton()
    private let exerciseButton = ExerciseButton()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.backgroundColor = BACKGROUND_COLOR
        physicsWorld.contactDelegate = self
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        createTitle()
        createText()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
            }
            
            if exerciseButton.node.contains(location) {
                exerciseButton.node.setScale(0.75)
                secondBrain.physicsBody?.applyImpulse(CGVector(dx: secondBrain.frame.width * 0.2, dy: 0))
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
                brain.serotoninNode.run(fadeAlphaOut)
                brain.dopamineNode.run(fadeAlphaOut)
                brain.noradrenalineNode.run(fadeAlphaOut)
                title.run(fadeOut)
                text.run(fadeOut)
                nextSceneButton.node.run(fadeOut)
                delay(duration: fadeOut.duration + 0.5, closure: {
                    self.title.removeFromParent()
                    self.text.removeFromParent()
                    self.nextSceneButton.node.removeFromParent()
                    self.brain.backBrainNode.run(moveToSerotoninSide)
                    self.brain.frontBrainNode.run(moveToSerotoninSide)
                    self.brain.serotoninNode.run(moveToSerotoninSide)
                    self.brain.dopamineNode.run(moveToSerotoninSide)
                    self.brain.noradrenalineNode.run(moveToSerotoninSide)
                    delay(duration: moveToSerotoninSide.duration, closure: {
                        self.brain.backBrainNode.run(unfocus)
                        self.brain.frontBrainNode.run(unfocus)
                        self.brain.serotoninNode.run(unfocus)
                        self.brain.dopamineNode.run(unfocus)
                        self.brain.noradrenalineNode.run(unfocus)
                        self.brain.backBrainNode.run(scaleUp)
                        self.brain.frontBrainNode.run(scaleUp)
                        self.brain.serotoninNode.run(scaleUp)
                        self.brain.dopamineNode.run(scaleUp)
                        self.brain.noradrenalineNode.run(scaleUp)
                        self.createTutorialText()
                        delay(duration: scaleUp.duration, closure: {
                            self.tutorialText.run(fadeIn)
                            self.addButtonNode()
                            self.exerciseButton.node.run(fadeIn)
                            self.addFullBrainNode()
                            self.secondBrain.run(fadeIn)
                            self.addFinishLine()
                            self.finishLine.run(fadeIn)
                        })
                    })
                })
            }
            if exerciseButton.node.contains(location) {
                exerciseButton.node.setScale(1.0)
            }
        }
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == secondBrain.name {
            secondBrain.physicsBody?.isDynamic = false
            secondBrain.run(fadeOut)
            finishLine.run(fadeOut)
            delay(duration: fadeOut.duration + 0.5, closure: {
                self.secondBrain.removeFromParent()
                self.finishLine.removeFromParent()
                self.exerciseButton.node.run(fadeOut)
                self.tutorialText.run(fadeOut)
                delay(duration: fadeOut.duration, closure: {
                    self.exerciseButton.node.removeFromParent()
                    self.tutorialText.removeFromParent()
                    self.brain.backBrainNode.run(moveToCenter)
                    self.brain.frontBrainNode.run(moveToCenter)
                    self.brain.serotoninNode.run(moveToCenter)
                    self.brain.dopamineNode.run(moveToCenter)
                    self.brain.noradrenalineNode.run(moveToCenter)
                    self.brain.backBrainNode.run(focus)
                    self.brain.frontBrainNode.run(focus)
                    delay(duration: moveToCenter.duration + 0.5, closure: {
                        self.brain.serotoninNode.run(fadeAlphaIn)
                        delay(duration: fadeAlphaIn.duration + 0.5, closure: {
                            transition(nextScene: SecondMiniGameScene(size: myScene.frame.size), currentScene: self)
                        })
                    })
                })
            })
        }
    }
    
    /// Constructor of the second brain
    private func addFullBrainNode() {
        secondBrain.name = FULL_BRAIN_NODE_TX
        secondBrain.scale(to: CGSize(width: myScene.frame.width * 0.2, height: myScene.frame.height * 0.2))
        secondBrain.position = CGPoint(x: myScene.frame.minX + secondBrain.size.width, y: myScene.frame.midY * 0.9)
        secondBrain.alpha = 0
        secondBrain.scene?.scaleMode = .aspectFit
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
    private func addButtonNode() {
        exerciseButton.addButton(skScene: self)
        exerciseButton.alpha = 0
    }
    
    /// Constructor of the finish line
    private func addFinishLine() {
        finishLine.name = "Finish line"
        finishLine.fillColor = .white
        finishLine.physicsBody = SKPhysicsBody(rectangleOf: finishLine.frame.size, center: CGPoint(x: finishLine.frame.midX, y: finishLine.frame.midY))
        finishLine.physicsBody?.allowsRotation = false
        finishLine.physicsBody?.affectedByGravity = false
        finishLine.physicsBody?.categoryBitMask = CollisionType.finishLine.rawValue
        
        addChild(finishLine)
    }
    
    /// Constructor of the first brain
    private func addAllBrainNodes() {
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
    private func createTitle() {
        title.text = "With this in mind, let's help Bruno?"
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    /// Constructor of the introduction to mini game text
    private func createText() {
        text.text = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
        text.position = CGPoint(x: myScene.frame.midX, y: title.frame.minY * 0.775)
        text.fontSize = MAIN_SUBTITLE_SIZE_FONT
        text.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        text.numberOfLines = 2
        addChild(text)
    }
    
    /// Constructor of the tutorial text
    private func createTutorialText() {
        tutorialText.text = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise"
        tutorialText.position = CGPoint(x: myScene.frame.minX + (myScene.frame.width * 0.45), y: myScene.frame.maxY - (myScene.frame.height * 0.2))
        tutorialText.alpha = 0
        tutorialText.numberOfLines = 3
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        addChild(tutorialText)
    }
}
