//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class FirstScene: SKScene {
    
    private var brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private var title = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private var footer = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private var text = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private var touchCount = 0
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = BACKGROUND_COLOR
        brain.addBrain(skScene: self)
        nextSceneButton.addButton(skScene: self)
        addTitleText()
        addFooterText()
        addText()
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
                touchCount += 1
                nextSceneButton.node.setScale(1.25)
                nextSceneButton.node.alpha = 1.0
                title.run(fadeOut)
                footer.run(fadeOut)
                brain.backBrainNode.run(moveUp)
                brain.frontBrainNode.run(moveUp)
                delay(moveUp.duration, closure: {
                    self.title.removeFromParent()
                    self.footer.removeFromParent()
                    self.text.run(fadeIn)
                })
            }
            
            if touchCount == 2 && nextSceneButton.node.contains(location) {
                transition(nextScene: SecondScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
    
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        footer.fontSize = MAIN_BODY_SIZE_FONT
        footer.preferredMaxLayoutWidth = myScene.frame.size.width - 70
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    private func addText() {
        text.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nSo... Let's talk about Depression?"
        text.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        text.fontSize = MAIN_BODY_SIZE_FONT
        text.preferredMaxLayoutWidth = myScene.frame.size.width - 70
        text.numberOfLines = 4
        text.alpha = 0
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
