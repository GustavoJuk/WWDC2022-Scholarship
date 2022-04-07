//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class SecondMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let bacon = Bacon()
    private let chocolate = Chocolate()
    private let donut = Donut()
    private let eggs = Eggs()
    private let fries = Fries()
    private let soda = Soda()
    private let shelfTop = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    private let shelfBottom = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    
    public override func sceneDidLoad() {
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        addTutorialText()
        addFoodNodes()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let clickedNode = self.nodes(at: location)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
                brain.backBrainNode.run(moveToDopamineSide)
                brain.frontBrainNode.run(moveToDopamineSide)
                brain.serotoninNode.run(moveToDopamineSide)
                brain.dopamineNode.run(moveToDopamineSide)
                brain.noradrenalineNode.run(moveToDopamineSide)
                delay(moveToDopamineSide.duration, closure: {
                    self.nextSceneButton.node.run(fadeOut)
                    self.tutorialText.run(fadeIn)
                    self.bacon.node.run(fadeIn)
                    self.chocolate.node.run(fadeIn)
                    self.donut.node.run(fadeIn)
                    self.eggs.node.run(fadeIn)
                    self.fries.node.run(fadeIn)
                    self.soda.node.run(fadeIn)
                    self.shelfTop.run(fadeIn)
                    self.shelfBottom.run(fadeIn)
                    delay(fadeOut.duration, closure: {
                        self.nextSceneButton.node.removeFromParent()
                    })
                })
            }
            
            switch clickedNode.first?.name {
            case HEALTHY_FOOD_NODE_NM:
                correctOption(with: clickedNode.first!)

            case UNHEALTHY_FOOD_NODE_NM:
                wrongOption(with: clickedNode.first!)

            default: break
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
        }
    }
    
    private func correctOption(with node: SKNode) {
        node.run(fadeOut)
        delay(fadeOut.duration + 0.5, closure: {
            node.removeFromParent()
            self.tutorialText.run(fadeOut)
            self.bacon.node.run(fadeOut)
            self.chocolate.node.run(fadeOut)
            self.donut.node.run(fadeOut)
            self.eggs.node.run(fadeOut)
            self.fries.node.run(fadeOut)
            self.soda.node.run(fadeOut)
            self.shelfTop.run(fadeOut)
            self.shelfBottom.run(fadeOut)
            delay(fadeOut.duration, closure: {
                self.tutorialText.removeFromParent()
                self.bacon.node.removeFromParent()
                self.chocolate.node.removeFromParent()
                self.donut.node.removeFromParent()
                self.eggs.node.removeFromParent()
                self.fries.node.removeFromParent()
                self.soda.node.removeFromParent()
                self.shelfTop.removeFromParent()
                self.shelfBottom.removeFromParent()
                self.brain.backBrainNode.run(moveToCenter)
                self.brain.frontBrainNode.run(moveToCenter)
                self.brain.serotoninNode.run(moveToCenter)
                self.brain.dopamineNode.run(moveToCenter)
                self.brain.noradrenalineNode.run(moveToCenter)
                delay(moveToCenter.duration + 0.5, closure: {
                    self.brain.dopamineNode.run(fadeAlphaInHalf)
                    delay(fadeAlphaInHalf.duration + 0.5, closure: {
                        transition(nextScene: ThirdMiniGameScene(size: MYVIEW.frame.size), currentScene: self)
                    })
                })
            })
        })
    }
    
    private func wrongOption(with node: SKNode) {
        node.run(SKAction.shake(initialPosition: node.position, duration: 0.5))
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
        brain.dopamineNode.alpha = 0.25
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func addTutorialText() {
        tutorialText.text = "Now let's get the Dopamine that Bruno needs!\nHe must have a balanced Diet"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = MAIN_SUBTITLE_SIZE_FONT
        tutorialText.position = CGPoint(x: (MYVIEW.frame.midX * 1.35) - 30 , y: MYVIEW.frame.midY * 1.5)
        addChild(tutorialText)
    }
    
    private func addFoodNodes() {
        //Top shelf
        addTopShelf(at_X: MYVIEW.frame.midX, at_Y: MYVIEW.frame.midY / 1.5)
        
        eggs.addFood(skScene: self)
        eggs.node.alpha = 0
        eggs.node.position = CGPoint(x: shelfTop.frame.midX / 2, y: shelfTop.frame.midY)
        
        fries.addFood(skScene: self)
        fries.node.alpha = 0
        fries.node.position = CGPoint(x: shelfTop.frame.midX, y: eggs.node.frame.minY)
        
        soda.addFood(skScene: self)
        soda.node.alpha = 0
        soda.node.position = CGPoint(x: shelfTop.frame.midX * 1.5, y: eggs.node.frame.minY)
        
        //Bottom shelf
        addBottomShelf(at_X: MYVIEW.frame.midX, at_Y: MYVIEW.frame.midY / 4.5)
        
        bacon.addFood(skScene: self)
        bacon.node.alpha = 0
        bacon.node.position = CGPoint(x: shelfBottom.frame.midX / 2, y: shelfBottom.frame.midY)
        
        donut.addFood(skScene: self)
        donut.node.alpha = 0
        donut.node.position = CGPoint(x: shelfBottom.frame.midX, y: bacon.node.frame.minY)
        
        chocolate.addFood(skScene: self)
        chocolate.node.alpha = 0
        chocolate.node.position = CGPoint(x: shelfBottom.frame.midX * 1.5, y: bacon.node.frame.minY)
    }
    
    private func addTopShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfTop.position = CGPoint(x: xPosition, y: yPosition)
        shelfTop.alpha = 0
        shelfTop.scale(to: CGSize(width: MYVIEW.frame.width / 1.5, height: MYVIEW.frame.height / shelfTop.frame.height))
        
        shelfTop.zPosition = -1
        addChild(shelfTop)
    }
    
    private func addBottomShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfBottom.position = CGPoint(x: xPosition, y: yPosition)
        shelfBottom.alpha = 0
        shelfBottom.scale(to: CGSize(width: MYVIEW.frame.width / 1.5, height: MYVIEW.frame.height / shelfBottom.frame.height))
        shelfBottom.zPosition = -1
        addChild(shelfBottom)
    }
}