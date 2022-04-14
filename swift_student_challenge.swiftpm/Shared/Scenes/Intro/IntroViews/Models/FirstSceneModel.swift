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
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        addChild(title)
    }
    
    /// Constructor of the footer text
    func addFooterText() {
        footer.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        footer.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    /// Constructor of the context text
    func addContextText() {
        callForAction.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        callForAction.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        callForAction.numberOfLines = 4
        callForAction.alpha = 0
        addChild(callForAction)
    }
}
