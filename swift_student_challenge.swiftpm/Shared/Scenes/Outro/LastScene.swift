//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 12/04/22.
//

import SpriteKit

public class LastScene: SKScene {
    private let outroText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let brain = Brain()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 1.0))
        self.backgroundColor = BACKGROUND_COLOR
        addOutroText()
        addBrain()
    }
    
    /// Constructor of the brain
    private func addBrain() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: myScene.frame.width * 0.75 - (brain.backBrainNode.frame.width * 0.25), height: myScene.frame.height * 0.75))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
        
        brain.backBrainNode.alpha = 0.3
        brain.frontBrainNode.alpha = 0.3
        brain.serotoninNode.alpha = 0.3
        brain.dopamineNode.alpha = 0.3
        brain.noradrenalineNode.alpha = 0.3
    }
    
    /// Constructor of the outro text
    private func addOutroText() {
        outroText.text = "Thanks for playing!"
        outroText.fontSize = MAIN_TITLE_SIZE_FONT
        outroText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        outroText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        outroText.verticalAlignmentMode = .center
        outroText.numberOfLines = 4
        addChild(outroText)
    }
}

