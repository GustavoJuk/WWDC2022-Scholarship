//
//  File.swift
//
//
//  Created by Gustavo Juk Ferreira Cruz on 12/04/22.
//

import SpriteKit

public class IntroScene: SKScene {
    public let introText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 1.0))
        self.backgroundColor = BACKGROUND_COLOR
        addIntroText()
        delay(duration: 10, closure: {
            transition(nextScene: FirstScene(size: myScene.frame.size), currentScene: self)
        })
    }
}
