//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class ThirdMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let sleepButton = SleepButton()
    private let sleepGraphic = SleepGraphic()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        addTutorialText()
        sleepButton.addButton(skScene: self)
        sleepGraphic.addGraphic(skScene: self)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
            }
            
            if sleepButton.node.contains(location) {
                sleepButton.node.setScale(0.8)
                sleepButton.node.alpha = 0.5
                sleepGraphic.cropNode.maskNode?.run(SKAction.scaleX(to: sleepGraphic.graphBackground.xScale / (sleepGraphic.graphBackground.xScale * 0.031), duration: 1.5))
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
                brain.backBrainNode.run(moveToNoradrenalineSide)
                brain.frontBrainNode.run(moveToNoradrenalineSide)
                brain.serotoninNode.run(moveToNoradrenalineSide)
                brain.dopamineNode.run(moveToNoradrenalineSide)
                brain.noradrenalineNode.run(moveToNoradrenalineSide)
                brain.backBrainNode.run(unfocus)
                brain.frontBrainNode.run(unfocus)
                brain.serotoninNode.run(unfocus)
                nextSceneButton.node.run(fadeOut)
                delay(duration: moveToNoradrenalineSide.duration, closure: {
                    self.nextSceneButton.node.removeFromParent()
                    self.tutorialText.run(fadeIn)
                    self.sleepButton.node.run(fadeIn)
                    self.sleepGraphic.graphic.run(fadeIn)
                    self.sleepGraphic.safeArea.run(fadeAlphaInHalf)
                    self.sleepGraphic.graphBackground.run(fadeAlphaInHalf)
                })
            }
            
            if sleepButton.node.contains(location) {
                sleepButton.node.setScale(1.0)
                sleepButton.node.alpha = 1.0
                sleepGraphic.cropNode.maskNode?.removeAllActions()
                if rightPosition(nodeMaxWidth: sleepGraphic.cropNode.maskNode!.frame.maxX) {
                    delay(duration: 0.5, closure: {
                        self.tutorialText.run(fadeOut)
                        self.sleepButton.node.run(fadeOut)
                        self.sleepGraphic.graphic.run(fadeOut)
                        self.sleepGraphic.safeArea.run(fadeOut)
                        self.sleepGraphic.graphBackground.run(fadeOut)
                        delay(duration: fadeOut.duration + 0.5, closure: {
                            self.tutorialText.removeFromParent()
                            self.sleepButton.node.removeFromParent()
                            self.sleepGraphic.graphic.removeFromParent()
                            self.sleepGraphic.safeArea.removeFromParent()
                            self.sleepGraphic.graphBackground.removeFromParent()
                            self.brain.backBrainNode.run(moveToCenter)
                            self.brain.frontBrainNode.run(moveToCenter)
                            self.brain.serotoninNode.run(moveToCenter)
                            self.brain.dopamineNode.run(moveToCenter)
                            self.brain.noradrenalineNode.run(moveToCenter)
                            self.brain.backBrainNode.run(focus)
                            self.brain.frontBrainNode.run(focus)
                            self.brain.serotoninNode.run(focus)
                            delay(duration: moveToCenter.duration + 0.5, closure: {
                                self.brain.noradrenalineNode.run(fadeAlphaIn)
                                delay(duration: fadeAlphaIn.duration + 0.5, closure: {
                                    transition(nextScene: LastScene(size: myScene.frame.size), currentScene: self)
                                })
                            })
                        })
                    })
                } else {
                    sleepGraphic.cropNode.maskNode?.run(SKAction.scaleX(to: sleepGraphic.graphBackground.xScale - (sleepGraphic.graphBackground.xScale * 0.1), duration: 0.5))
                }
            }
        }
    }
    
    private func rightPosition(nodeMaxWidth nodeMaxX: CGFloat) -> Bool {
        if nodeMaxX >= sleepGraphic.safeArea.frame.minX && nodeMaxX <= sleepGraphic.safeArea.frame.maxX {
            return true
        }
        return false
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: myScene.frame.width * 0.75, height: myScene.frame.height * 0.75))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.serotoninNode.alpha = 1.0
        brain.dopamineNode.alpha = 1.0
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func addTutorialText() {
        tutorialText.text = "The last part is Bruno's Noradrenaline. Help him getting a good amount of Sleep!"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        tutorialText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.2))
        addChild(tutorialText)
    }
}
