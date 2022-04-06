//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class FirstMiniGameScene: SKScene, SKPhysicsContactDelegate {
    
    private let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Bold")
    private let text = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let finishLine = SKShapeNode(rect: CGRect(origin: CGPoint(x: MYVIEW.frame.midX * 1.75, y: MYVIEW.frame.midY - (MYVIEW.frame.midY / 1.15)), size: CGSize(width: MYVIEW.frame.width / 48, height: MYVIEW.frame.height / 5)))
    private let brain = Brain()
    private let secondBrain = SKSpriteNode(imageNamed: FULL_BRAIN_NODE_TX)
    private let nextSceneButton = NextSceneButton()
    private let exerciseButton = ExerciseButton()

    public override func sceneDidLoad() {
        super.sceneDidLoad()
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
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                brain.serotoninNode.run(fadeAlphaOut)
                brain.dopamineNode.run(fadeAlphaOut)
                brain.noradrenalineNode.run(fadeAlphaOut)
                title.run(fadeOut)
                text.run(fadeOut)
                nextSceneButton.node.run(fadeOut)
                delay(fadeOut.duration, closure: {
                    self.title.removeFromParent()
                    self.text.removeFromParent()
                    delay(fadeOut.duration, closure: {
                        self.brain.backBrainNode.run(moveToSerotoninSide)
                        self.brain.frontBrainNode.run(moveToSerotoninSide)
                        self.brain.serotoninNode.run(moveToSerotoninSide)
                        self.brain.dopamineNode.run(moveToSerotoninSide)
                        self.brain.noradrenalineNode.run(moveToSerotoninSide)
                        delay(moveToSerotoninSide.duration, closure: {
                            self.brain.backBrainNode.run(scaleUp)
                            self.brain.frontBrainNode.run(scaleUp)
                            self.brain.serotoninNode.run(scaleUp)
                            self.brain.dopamineNode.run(scaleUp)
                            self.brain.noradrenalineNode.run(scaleUp)
                            self.createTutorialText()
                            delay(scaleUp.duration, closure: {
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
                })
            }
            
            if exerciseButton.node.contains(location) {
                exerciseButton.node.setScale(0.75)
                secondBrain.physicsBody?.applyImpulse(CGVector(dx: secondBrain.frame.width / 8, dy: 0))
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
            }
            if exerciseButton.node.contains(location) {
                exerciseButton.node.setScale(1.0)
            }
        }
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)

        if contact.bodyA.node?.name == secondBrain.name {
            secondBrain.physicsBody?.isDynamic = false
            secondBrain.run(fadeOut)
            finishLine.run(fadeOut)
            delay(fadeOut.duration + 0.5, closure: {
                self.secondBrain.removeFromParent()
                self.finishLine.removeFromParent()
                self.exerciseButton.node.run(fadeOut)
                self.tutorialText.run(fadeOut)
                delay(fadeOut.duration, closure: {
                    self.exerciseButton.node.removeFromParent()
                    self.tutorialText.removeFromParent()
                    delay(fadeOut.duration, closure: {
                        self.brain.backBrainNode.run(moveToCenter)
                        self.brain.frontBrainNode.run(moveToCenter)
                        self.brain.serotoninNode.run(moveToCenter)
                        self.brain.dopamineNode.run(moveToCenter)
                        self.brain.noradrenalineNode.run(moveToCenter)
                        delay(moveToCenter.duration + 0.5, closure: {
                            self.brain.serotoninNode.run(fadeAlphaUp)
                            delay(fadeAlphaUp.duration + 0.5, closure: {
                                transition(nextScene: SecondMiniGameScene(size: MYVIEW.frame.size), currentScene: self)
                            })
                        })
                    })
                })
            })
        }
    }
    
    private func addFullBrainNode() {
        secondBrain.name = FULL_BRAIN_NODE_TX
        secondBrain.scale(to: CGSize(width: secondBrain.frame.width / 2, height: secondBrain.frame.height / 2))
        secondBrain.position = CGPoint(x: MYVIEW.frame.midX - (MYVIEW.frame.midX / 1.5), y: MYVIEW.frame.midY - (MYVIEW.frame.midY / 1.5))
        secondBrain.alpha = 0
        secondBrain.scale(to: CGSize(width: MYVIEW.frame.width / 5, height: MYVIEW.frame.height / 5))
        secondBrain.physicsBody = SKPhysicsBody(texture: secondBrain.texture!, size: secondBrain.size)
        secondBrain.physicsBody?.affectedByGravity = false
        secondBrain.physicsBody?.allowsRotation = false
        secondBrain.physicsBody?.categoryBitMask = CollisionType.brain.rawValue
        secondBrain.physicsBody?.collisionBitMask = CollisionType.finishLine.rawValue
        secondBrain.physicsBody?.contactTestBitMask = CollisionType.finishLine.rawValue
        
        addChild(secondBrain)
    }
    
    private func addButtonNode() {
        exerciseButton.addButton(skScene: self)
        exerciseButton.alpha = 0
    }
    
    private func addFinishLine() {
        finishLine.name = "Finish line"
        finishLine.fillColor = .white
        finishLine.physicsBody = SKPhysicsBody(rectangleOf: finishLine.frame.size, center: CGPoint(x: finishLine.frame.midX, y: finishLine.frame.midY))
        finishLine.physicsBody?.allowsRotation = false
        finishLine.physicsBody?.affectedByGravity = false
        finishLine.physicsBody?.categoryBitMask = CollisionType.finishLine.rawValue
        
        addChild(finishLine)
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY / 1.5)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func createTitle() {
        title.text = "With this in mind, let's help Bruno?"
        title.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY * 1.7)
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    private func createText() {
        text.text = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
        text.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY * 1.3)
        text.fontSize = MAIN_SUBTITLE_SIZE_FONT
        text.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 30
        text.numberOfLines = 2
        addChild(text)
    }
    
    private func createTutorialText() {
        tutorialText.text = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 3
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        tutorialText.position = CGPoint(x: MYVIEW.frame.minX + (tutorialText.frame.size.width / 2) + 30, y: MYVIEW.frame.maxY - (brain.backBrainNode.frame.size.height / 2))
        addChild(tutorialText)
    }
}
