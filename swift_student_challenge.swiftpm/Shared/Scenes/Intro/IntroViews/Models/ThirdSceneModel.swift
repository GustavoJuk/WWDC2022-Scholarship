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
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY * 0.7)
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.numberOfLines = 10
        addChild(article)
    }
}
