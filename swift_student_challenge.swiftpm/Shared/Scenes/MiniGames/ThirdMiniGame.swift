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
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        addTutorialText()
        sleepButton.addButton(skScene: self)
        addGraphic()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
                brain.backBrainNode.run(moveToNoradrenalineSide)
                brain.frontBrainNode.run(moveToNoradrenalineSide)
                brain.serotoninNode.run(moveToNoradrenalineSide)
                brain.dopamineNode.run(moveToNoradrenalineSide)
                brain.noradrenalineNode.run(moveToNoradrenalineSide)
                nextSceneButton.node.run(fadeOut)
                delay(moveToNoradrenalineSide.duration, closure: {
                    self.tutorialText.run(fadeIn)
                    self.sleepButton.node.run(fadeIn)
                    self.sleepGraphic.graphic.run(fadeIn)
                    self.sleepGraphic.safeArea.run(fadeAlphaInHalf)
                    self.sleepGraphic.graphBackground.run(fadeAlphaInHalf)
                })
            }
            
            if sleepButton.node.contains(location) {
                sleepButton.node.setScale(0.8)
                sleepButton.node.alpha = 0.5
                sleepGraphic.cropNode.maskNode?.run(SKAction.scaleX(to: 44, duration: 1.5))
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
            
            if sleepButton.node.contains(location) {
                sleepButton.node.setScale(1.0)
                sleepButton.node.alpha = 1.0
                sleepGraphic.cropNode.maskNode?.removeAllActions()
                if sleepGraphic.cropNode.maskNode!.frame.maxX >= sleepGraphic.safeArea.frame.minX && sleepGraphic.cropNode.maskNode!.frame.maxX <= sleepGraphic.safeArea.frame.maxX {
                    delay(0.5, closure: {
                        self.tutorialText.run(fadeOut)
                        self.sleepButton.node.run(fadeOut)
                        self.sleepGraphic.graphic.run(fadeOut)
                        self.sleepGraphic.safeArea.run(fadeOut)
                        self.sleepGraphic.graphBackground.run(fadeOut)
                        delay(fadeOut.duration + 0.5, closure: {
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
                            delay(moveToCenter.duration + 0.5, closure: {
                                self.brain.noradrenalineNode.run(fadeAlphaUp)
                            })
                        })
                    })
                } else {
                    sleepGraphic.cropNode.maskNode?.xScale = 10
                }
            }
        }
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width * 2.0, height: brain.backBrainNode.frame.height * 2.0))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.serotoninNode.alpha = 1.0
        brain.dopamineNode.alpha = 1.0
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func addTutorialText() {
        tutorialText.text = "The last part is Bruno's Noradrenaline.\nHelp him getting a good amount of Sleep!"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        tutorialText.position = CGPoint(x: MYVIEW.frame.maxX - (tutorialText.frame.width / 2) - 30, y: MYVIEW.frame.minY + (tutorialText.frame.height / 2))
        addChild(tutorialText)
    }
    
    private func addGraphic() {
        sleepGraphic.addGraphic(skScene: self)
    }
}
