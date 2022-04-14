//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension ThirdScene {
    
    /// Constructor of the graphic text
    func addText() {
        article.text = "To sum up, what happens in the brain of a deprressed person is the decrease of the neurotransmitters witch are responsable to funcitons like humor regulation, sleep, motivation and energy."
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY * 0.7)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.numberOfLines = 10
        addChild(article)
    }
}
