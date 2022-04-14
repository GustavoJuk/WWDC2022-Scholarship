//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension FirstScene {
    
    /// Constructor of the title text
    func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    /// Constructor of the footer text
    func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        footer.fontSize = MAIN_BODY_SIZE_FONT
        footer.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    /// Constructor of the context text
    func addContextText() {
        callForAction.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nMaybe not! And in fact many people ignore their mental health until it becomes a more serious problem. So I wanted to draw attention to one of these problems: Depression!"
        callForAction.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        callForAction.fontSize = MAIN_BODY_SIZE_FONT
        callForAction.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        callForAction.numberOfLines = 4
        callForAction.alpha = 0
        addChild(callForAction)
    }
}
