//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 14/04/22.
//

import SpriteKit

public extension SecondScene {
    
    /// Constructor of the article text
    func addText() {
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.verticalAlignmentMode = .center
        article.numberOfLines = 10
        addChild(article)
    }
}
