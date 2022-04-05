//
//  File.swift
//  
//
//  Created by Gustavo Juk Ferreira Cruz on 05/04/22.
//

import SpriteKit

public class FirstScene: SKScene {
    
    private var brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private var title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Bold")
    private var footer = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private var text = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    
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
        let scaleThisUp = SKAction.scale(by: 1.5, duration: 0.5)
        
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                title.run(fadeOut)
                footer.run(fadeOut)
                brain.backBrainNode.run(scaleThisUp)
                brain.frontBrainNode.run(scaleThisUp)
                delay(scaleUp.duration, closure: {
                    self.text.run(fadeIn)
                })
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(1.0)
                nextSceneButton.node.alpha = 1.0
            }
            
            if touch.tapCount == 2 && nextSceneButton.node.contains(location) {
                transition(nextScene: SecondScene(size: MYVIEW.frame.size), currentScene: self)
            }
        }
    }
    
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY * 1.7)
        addChild(title)
    }
    
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY / 2.5)
        footer.fontSize = MAIN_BODY_SIZE_FONT
        footer.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 30
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    private func addText() {
        text.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nSo... Let's talk about Depression?"
        text.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY / 4)
        text.fontSize = MAIN_BODY_SIZE_FONT
        text.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 30
        text.numberOfLines = 4
        text.alpha = 0
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
