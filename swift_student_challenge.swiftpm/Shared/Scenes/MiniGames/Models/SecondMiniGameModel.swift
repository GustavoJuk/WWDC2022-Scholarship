//
//  File.swift
//
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension SecondMiniGameScene {
    
    /// This method verify if the clicked node is a healthy food and preforms the rest of the animations
    /// - Parameter node: The food in witch will make the animation
    func correctOption(with node: SKNode) {
        node.run(fadeOut)
        
        generatorHeavy.prepare()
        generatorHeavy.impactOccurred()
        
        sound = SKAction.playSoundFileNamed(AudioNames.SECOND_MG_RIGHT_OPTION.rawValue, waitForCompletion: false)
        run(sound)
        
        delay(duration: fadeOut.duration + 0.5, closure: {
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
            delay(duration: fadeOut.duration, closure: {
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
                self.brain.backBrainNode.run(focus)
                self.brain.frontBrainNode.run(focus)
                self.brain.serotoninNode.run(focus)
                delay(duration: moveToCenter.duration + 0.5, closure: {
                    self.brain.dopamineNode.run(fadeIn)
                    delay(duration: fadeIn.duration + 0.5, closure: {
                        transition(nextScene: ThirdMiniGameScene(size: myScene.frame.size), currentScene: self)
                    })
                })
            })
        })
    }
    
    /// This methos verify if the clicked node is a unhealthy food and preforms the shake animation
    /// - Parameter node: The food in witch will make the animation
    func wrongOption(with node: SKNode) {
        node.run(SKAction.shake(initialPosition: node.position))
        
        generatorHeavy.prepare()
        generatorHeavy.impactOccurred()
        
        sound = SKAction.playSoundFileNamed(AudioNames.SECOND_MG_WRONG_OPTION.rawValue, waitForCompletion: false)
        run(sound)
    }
    
    /// Constructor of the brain
    func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: myScene.frame.width * 0.75 - (brain.backBrainNode.frame.width * 0.25), height: myScene.frame.height * 0.75))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.serotoninNode.alpha = 1.0
        brain.dopamineNode.alpha = 0.25
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    /// Constructor of the tutorial text
    func addTutorialText() {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: SECOND_GAME_TUTORIAL_TEXT, attributes: [.font: MAIN_DEFAULT_SIZE_FONT, .foregroundColor: SKColor.white]))
        attributedText.addAttributes([.foregroundColor: DOPAMINE_COLOR], range: attributedText.mutableString.range(of: "Dopamine"))
        attributedText.addAttributes([.foregroundColor: DIET_COLOR], range: attributedText.mutableString.range(of: "Diet"))
        tutorialText.attributedText = attributedText
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        tutorialText.numberOfLines = 2
        tutorialText.position = CGPoint(x: myScene.frame.maxX - (myScene.frame.width * 0.46), y: myScene.frame.maxY - (myScene.frame.height * 0.25))
        addChild(tutorialText)
    }
    
    /// Constructor of the food
    func addFoodNodes() {
        
        //Top shelf
        addTopShelf(at_X: myScene.frame.midX, at_Y: myScene.frame.midY * 0.6)

        eggs.addFood(skScene: self)
        eggs.node.alpha = 0
        eggs.node.position = CGPoint(x: shelfTop.frame.midX * 0.5, y: shelfTop.frame.midY)

        fries.addFood(skScene: self)
        fries.node.alpha = 0
        fries.node.position = CGPoint(x: shelfTop.frame.midX, y: eggs.node.frame.minY)

        soda.addFood(skScene: self)
        soda.node.alpha = 0
        soda.node.position = CGPoint(x: shelfTop.frame.midX * 1.5, y: eggs.node.frame.minY)

        //Bottom shelf
        addBottomShelf(at_X: myScene.frame.midX, at_Y: shelfTop.frame.midY - (myScene.frame.height * 0.2))

        bacon.addFood(skScene: self)
        bacon.node.alpha = 0
        bacon.node.position = CGPoint(x: shelfBottom.frame.midX * 0.5, y: shelfBottom.frame.midY)

        donut.addFood(skScene: self)
        donut.node.alpha = 0
        donut.node.position = CGPoint(x: shelfBottom.frame.midX, y: bacon.node.frame.minY)

        chocolate.addFood(skScene: self)
        chocolate.node.alpha = 0
        chocolate.node.position = CGPoint(x: shelfBottom.frame.midX * 1.5, y: shelfBottom.frame.minY * 1.2)
    }
    
    /// Constructor of the first shelf
    func addTopShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfTop.position = CGPoint(x: xPosition, y: yPosition)
        shelfTop.alpha = 0
        shelfTop.scale(to: CGSize(width: myScene.frame.width * 0.75, height: myScene.frame.height / shelfTop.frame.height))
        
        shelfTop.zPosition = -1
        addChild(shelfTop)
    }
    
    /// Constructor of the second shelf
    func addBottomShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfBottom.position = CGPoint(x: xPosition, y: yPosition)
        shelfBottom.alpha = 0
        shelfBottom.scale(to: CGSize(width: myScene.frame.width * 0.75, height: myScene.frame.height / shelfBottom.frame.height))
        shelfBottom.zPosition = -1
        addChild(shelfBottom)
    }
}
