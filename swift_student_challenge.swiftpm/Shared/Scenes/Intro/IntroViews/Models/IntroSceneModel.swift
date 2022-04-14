//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension IntroScene {

    /// Constructor of the Onboarding text
    func addIntroText() {
        introText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        introText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        introText.verticalAlignmentMode = .center
        introText.numberOfLines = 4
        addChild(introText)
    }
}
