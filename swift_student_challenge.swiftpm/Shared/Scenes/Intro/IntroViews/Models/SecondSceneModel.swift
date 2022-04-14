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
        article.text = "Much is discussed about depression and how terrible is... but, do you know what happens exactly?\n\nDepression is classified as a disease because of its symptoms, which affect not only the psychological area, but also the body, since chemical processes take place when a person feels this way.\n\nMost people have a misunderstanding about this issue because it is not a visible thing. Also the same people who judge the victims do not know what is going on inside their minds and bodies."
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.verticalAlignmentMode = .center
        article.numberOfLines = 10
        addChild(article)
    }
}
