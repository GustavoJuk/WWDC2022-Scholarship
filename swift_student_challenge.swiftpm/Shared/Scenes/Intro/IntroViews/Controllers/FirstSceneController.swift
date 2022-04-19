//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class FirstScene: SKScene {
    
    public var brain = Brain()
    public let nextSceneButton = NextSceneButton()
    public var title = SKLabelNode(attributedText: NSAttributedString(string: TITLE_TEXT, attributes: [.font: MAIN_TITLE_SIZE_FONT, .foregroundColor: SKColor.white]))
    public var footer = SKLabelNode(attributedText: NSAttributedString(string: FOOTER_TEXT, attributes: [.font: MAIN_BODY_SIZE_FONT, .foregroundColor: SKColor.white]))
    public var callForAction = SKLabelNode(attributedText: NSAttributedString(string: CALL_FOR_ACTION_TEXT, attributes: [.font: MAIN_BODY_SIZE_FONT, .foregroundColor: SKColor.white]))
    public var touchCount = 0
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = BACKGROUND_COLOR
        self.scene?.run(SKAction.fadeIn(withDuration: 0.75))
        self.alpha = 0
        brain.addBrain(skScene: self)
        nextSceneButton.addButton(skScene: self)
        addTitleText()
        addFooterText()
        addContextText()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.2)
                nextSceneButton.node.alpha = 0.5
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextSceneButton.node.contains(location) {
                touchCount += 1
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
                if touchCount == 1 {
                    title.run(fadeOut)
                    footer.run(fadeOut)
                    brain.backBrainNode.run(moveUp)
                    brain.frontBrainNode.run(moveUp)
                    brain.backBrainNode.run(scaleDown)
                    brain.frontBrainNode.run(scaleDown)
                    delay(duration: scaleDown.duration, closure: {
                        self.title.removeFromParent()
                        self.footer.removeFromParent()
                        self.callForAction.run(fadeIn)
                    })
                }
            }
            
            if touchCount == 2 && nextSceneButton.node.contains(location) {
                transition(nextScene: SecondScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
