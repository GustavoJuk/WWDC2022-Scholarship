//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class SecondMiniGameScene: SKScene {
    
    public let brain = Brain()
    public let nextSceneButton = NextSceneButton()
    public let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    public let bacon = Bacon()
    public let chocolate = Chocolate()
    public let donut = Donut()
    public let eggs = Eggs()
    public let fries = Fries()
    public let soda = Soda()
    public let shelfTop = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    public let shelfBottom = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    
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
            let clickedNode = self.nodes(at: location)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
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
                brain.backBrainNode.run(moveToDopamineSide)
                brain.frontBrainNode.run(moveToDopamineSide)
                brain.serotoninNode.run(moveToDopamineSide)
                brain.dopamineNode.run(moveToDopamineSide)
                brain.noradrenalineNode.run(moveToDopamineSide)
                brain.backBrainNode.run(unfocus)
                brain.frontBrainNode.run(unfocus)
                brain.serotoninNode.run(unfocus)
                delay(duration: moveToDopamineSide.duration, closure: {
                    self.addFoodNodes()
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
                    delay(duration: fadeOut.duration, closure: {
                        self.nextSceneButton.node.removeFromParent()
                    })
                })
            }
        }
    }
}
