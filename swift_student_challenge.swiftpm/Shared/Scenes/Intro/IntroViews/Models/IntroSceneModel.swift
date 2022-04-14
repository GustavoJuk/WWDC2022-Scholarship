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
        introText.text = "This interactive scene is NOT intended to treat people with depressive symptoms, only to draw attention to the problem, showing in a playful way a layoperson's view of what goes on behind the scenes in our heads."
        introText.fontSize = MAIN_BODY_SIZE_FONT
        introText.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        introText.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        introText.verticalAlignmentMode = .center
        introText.numberOfLines = 4
        addChild(introText)
    }
}
