//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

extension ThirdMiniGameScene {
    
    /// THis method will verify if the position of the maxX scale of the specific node is at the safe area
    /// - Parameter nodeMaxX: The maxX axys of a node
    /// - Returns: Returns a boolean
    func verifyPosition(nodeMaxWidth nodeMaxX: CGFloat) -> Bool {
        if nodeMaxX >= sleepGraphic.safeArea.frame.minX && nodeMaxX <= sleepGraphic.safeArea.frame.maxX {
            return true
        }
        return false
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
        brain.dopamineNode.alpha = 1.0
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    /// Constructor of the tutorial text
    func addTutorialText() {
        let mutableString = NSMutableAttributedString(attributedString: NSAttributedString(string: THIRD_GAME_TUTORIAL_TEXT, attributes: [.font: MAIN_DEFAULT_SIZE_FONT, .foregroundColor: SKColor.white]))
        mutableString.addAttributes([.foregroundColor: NORADRENALINE_COLOR], range: NSRange(location: 25, length: 13))
        mutableString.addAttributes([.foregroundColor: SLEEP_COLOR], range: NSRange(location: 74, length: 5))
        tutorialText.attributedText = mutableString
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        tutorialText.numberOfLines = 2
        tutorialText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.2))
        addChild(tutorialText)
    }
}
