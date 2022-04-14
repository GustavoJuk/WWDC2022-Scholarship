//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class ThirdMiniGameScene: SKScene {
    
    public let brain = Brain()
    public let nextSceneButton = NextSceneButton()
    public let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    public let sleepButton = SleepButton()
    public let sleepGraphic = SleepProgressBar()
    public var isSleepButtonPressed = false
    public var isMiniGameShowing = false
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        addTutorialText()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
            }
            
            if sleepButton.node.contains(location) {
                isSleepButtonPressed = true
                sleepButton.node.setScale(0.8)
                sleepButton.node.alpha = 0.5
                sleepGraphic.cropNode.maskNode?.run(SKAction.scaleX(to: sleepGraphic.barBackground.xScale * 18.6, duration: 1.5))
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                isMiniGameShowing = true
                sleepButton.addButton(skScene: self)
                sleepGraphic.addGraphic(skScene: self)
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
                    self.sleepGraphic.progressBar.run(fadeIn)
                    self.sleepGraphic.barBackground.run(fadeAlphaInHalf)
                })
            }
            
            if sleepButton.node.contains(location) {
                isSleepButtonPressed = false
                sleepButton.node.setScale(1.0)
                sleepButton.node.alpha = 1.0
                sleepGraphic.cropNode.maskNode?.removeAllActions()
                if verifyPosition(nodeMaxWidth: sleepGraphic.cropNode.maskNode!.frame.maxX) {
                    delay(duration: 0.5, closure: {
                        self.tutorialText.run(fadeOut)
                        self.sleepButton.node.run(fadeOut)
                        self.sleepGraphic.progressBar.run(fadeOut)
                        self.sleepGraphic.barBackground.run(fadeOut)
                        self.sleepGraphic.safeArea.removeFromParent()
                        self.isMiniGameShowing = false
                        delay(duration: fadeOut.duration + 0.5, closure: {
                            self.tutorialText.removeFromParent()
                            self.sleepButton.node.removeFromParent()
                            self.sleepGraphic.progressBar.removeFromParent()
                            self.sleepGraphic.barBackground.removeFromParent()
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
                    sleepGraphic.cropNode.maskNode?.run(SKAction.scaleX(to: sleepGraphic.barBackground.xScale - (sleepGraphic.barBackground.xScale * 0.1), duration: 0.5))
                }
            }
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if let maxXPosition = sleepGraphic.cropNode.maskNode?.frame.maxX {
            if verifyPosition(nodeMaxWidth: maxXPosition) {
                sleepGraphic.safeArea.run(.fadeIn(withDuration: 0.1))
            } else if isSleepButtonPressed {
                sleepGraphic.safeArea.run(.fadeAlpha(to: 0.25, duration: 0.1))
            } else if isMiniGameShowing && isSleepButtonPressed == false {
                delay(duration: fadeIn.duration + moveToNoradrenalineSide.duration, closure: {
                    self.sleepGraphic.safeArea.run(.fadeAlpha(to: 0.25, duration: 0.1))
                })
            } else {
                sleepGraphic.safeArea.run(.fadeAlpha(to: 0, duration: 0.1))
            }
        }
    }
}
