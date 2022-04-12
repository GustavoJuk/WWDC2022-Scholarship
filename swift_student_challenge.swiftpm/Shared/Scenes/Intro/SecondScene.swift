//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class SecondScene: SKScene {
    
    private var article = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let nextSceneButton = NextSceneButton()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.backgroundColor  = BACKGROUND_COLOR
        addText()
        nextSceneButton.addButton(skScene: self)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.9)
                nextSceneButton.node.alpha = 0.5
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
                transition(nextScene: ThirdScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
    
    private func addText() {
        article.text = "Much is discussed about depression and how terrible is... but, do you know what happens exactly?\n\nDepression is classified as a disease because of its symptoms, which affect not only the psychological area, but also the body, since chemical processes take place when a person feels this way.\n\nMost people have a misunderstanding about this issue because it is not a visible thing. Also the same people who judge the victims do not know what is going on inside their minds and bodies."
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.verticalAlignmentMode = .center
        article.numberOfLines = 10
        addChild(article)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
