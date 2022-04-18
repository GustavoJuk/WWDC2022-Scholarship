//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class FirstMiniGameScene: SKScene, SKPhysicsContactDelegate {
    
    public let title = SKLabelNode(attributedText: NSAttributedString(string: FIRST_GAME_TITLE_TEXT, attributes: [.font: MAIN_TITLE_SIZE_FONT, .foregroundColor: SKColor.white]))
    public let text = SKLabelNode(attributedText: NSAttributedString(string: FIRST_GAME_CONTEXT_TEXT, attributes: [.font: MAIN_DEFAULT_SIZE_FONT, .foregroundColor: SKColor.white]))
    public let tutorialText = SKLabelNode()
    public let finishLine = SKShapeNode(rect: CGRect(origin: CGPoint(x: myScene.frame.maxX - (myScene.frame.midX * 0.275), y: myScene.frame.midY * 0.65), size: CGSize(width: myScene.bounds.width * 0.025, height: myScene.bounds.height * 0.25)))
    public let brain = Brain()
    public let secondBrain = SKSpriteNode(imageNamed: FULL_BRAIN_NODE_TX)
    public let nextSceneButton = NextSceneButton()
    public let exerciseButton = ExerciseButton()
    
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
                nextSceneButton.node.setScale(1.2)
                nextSceneButton.node.alpha = 0.5
            }
            
            if exerciseButton.node.contains(location) {
                exerciseButton.node.setScale(0.95)
                exerciseButton.node.alpha = 0.5
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
                exerciseButton.node.alpha = 1.0
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
}
