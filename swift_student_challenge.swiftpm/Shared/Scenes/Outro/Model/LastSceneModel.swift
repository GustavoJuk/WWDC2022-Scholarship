//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension LastScene {
    
    /// Constructor of the brain
    func addBrain() {
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
    func addOutroText() {
        outroText.text = "Thanks for playing!"
        outroText.fontSize = MAIN_TITLE_SIZE_FONT
        outroText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        outroText.verticalAlignmentMode = .center
        addChild(outroText)
    }

}
