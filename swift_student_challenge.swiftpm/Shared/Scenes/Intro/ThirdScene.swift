//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class ThirdScene: SKScene {
    
    private let article = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private let nextSceneButton = NextSceneButton()
    private let seratonin = SerotoninGraphic()
    private let dopamine = DopamineGraphic()
    private let noradrenaline = NoradrenalineGraphic()
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.alpha = 0
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.backgroundColor = BACKGROUND_COLOR
        addText()
        nextSceneButton.addButton(skScene: self)
        seratonin.addGraphic(skScene: self)
        dopamine.addGraphic(skScene: self)
        noradrenaline.addGraphic(skScene: self)
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
                transition(nextScene: FirstMiniGameScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
    
    /// Constructor of the graphic text
    private func addText() {
        article.text = "To sum up, what happens in the brain of a deprressed person is the decrease of the neurotransmitters witch are responsable to funcitons like humor regulation, sleep, motivation and energy."
        article.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY * 0.7)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        article.numberOfLines = 10
        addChild(article)
    }
}