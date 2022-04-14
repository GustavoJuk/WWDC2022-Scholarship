//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 12/04/22.
//

import SpriteKit

public class LastScene: SKScene {
    
    public let outroText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    public let brain = Brain()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 1.0))
        self.backgroundColor = BACKGROUND_COLOR
        addOutroText()
        addBrain()
    }
}

