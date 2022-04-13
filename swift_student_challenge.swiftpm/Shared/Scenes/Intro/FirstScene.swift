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
    private var callForAction = SKLabelNode(fontNamed: "\(MAIN_FONT)")
    private var touchCount = 0
    
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
                delay(duration: moveUp.duration, closure: {
                    self.brain.backBrainNode.run(scaleDown)
                    self.brain.frontBrainNode.run(scaleDown)
                    delay(duration: scaleDown.duration, closure: {
                        self.title.removeFromParent()
                        self.footer.removeFromParent()
                        self.callForAction.run(fadeIn)
                    })
                })
            }
            
            if touchCount == 2 && nextSceneButton.node.contains(location) {
                transition(nextScene: SecondScene(size: myScene.frame.size), currentScene: self)
            }
        }
    }
    
    /// Constructor of the title text
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.maxY - (myScene.frame.height * 0.125))
        title.fontSize = MAIN_TITLE_SIZE_FONT
        addChild(title)
    }
    
    /// Constructor of the footer text
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        footer.fontSize = MAIN_BODY_SIZE_FONT
        footer.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    /// Constructor of the context text
    private func addContextText() {
        callForAction.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nMaybe not! And in fact many people ignore their mental health until it becomes a more serious problem. So I wanted to draw attention to one of these problems: Depression!"
        callForAction.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.25)
        callForAction.fontSize = MAIN_BODY_SIZE_FONT
        callForAction.preferredMaxLayoutWidth = myScene.frame.width - (myScene.frame.width * 0.1)
        callForAction.numberOfLines = 4
        callForAction.alpha = 0
        addChild(callForAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
