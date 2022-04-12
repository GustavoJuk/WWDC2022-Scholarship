//
//  File.swift
//
//
//  Created by Gustavo Juk Ferreira Cruz on 12/04/22.
//

import SpriteKit

public class IntroScene: SKScene {
    private let introText = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    
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
    
    /// Constructor of the Onboarding text
    private func addIntroText() {
        introText.text = "This interactive scene is NOT intended to treat people with depressive symptoms, only to draw attention to the problem, showing in a playful way a layoperson's view of what goes on behind the scenes in our heads."
        introText.fontSize = MAIN_BODY_SIZE_FONT
        introText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        introText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        introText.verticalAlignmentMode = .center
        introText.numberOfLines = 4
        addChild(introText)
    }
}

