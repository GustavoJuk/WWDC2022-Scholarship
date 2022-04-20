//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class ThirdScene: SKScene {
    
    public let article = SKLabelNode(attributedText: NSAttributedString(string: CONTEXT_TEXT, attributes: [.font: MAIN_BODY_SIZE_FONT, .foregroundColor: SKColor.white]))
    public let nextSceneButton = NextSceneButton()
    public let seratonin = SerotoninGraphic()
    public let dopamine = DopamineGraphic()
    public let noradrenaline = NoradrenalineGraphic()
    
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
                transition(nextScene: FirstMiniGameScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
}
