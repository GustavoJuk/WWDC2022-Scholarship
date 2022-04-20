//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class SecondScene: SKScene {
    
    public var article = SKLabelNode(attributedText: NSAttributedString(string: ARTICLE_TEXT, attributes: [.font: MAIN_BODY_SIZE_FONT, .foregroundColor: SKColor.white]))
    public let nextSceneButton = NextSceneButton()
    
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
                generatorMedium.prepare()
                generatorMedium.impactOccurred()
                nextSceneButton.node.setScale(1.2)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
