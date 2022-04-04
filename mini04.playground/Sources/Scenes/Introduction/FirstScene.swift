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
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = BACKGROUND_COLOR
        brain.addBrain(skScene: self)
        nextSceneButton.addButton(skScene: self)
        addTitleText()
        addFooterText()
        addText()
    }

    public override func mouseDown(with event: NSEvent) {
        
        let location = event.location(in: self)
        let scaleUp = SKAction.scale(by: 1.5, duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                title.run(fadeOut)
                footer.run(fadeOut)
                brain.backBrainNode.run(scaleUp)
                brain.frontBrainNode.run(scaleUp)
                delay(scaleUp.duration, closure: {
                    self.text.run(fadeIn)
                })
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickedNode in nodes(at: location) {
            if clickedNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(1.0)
                nextSceneButton.node.alpha = 1.0
            }
            
            if event.clickCount == 2 && clickedNode.name == nextSceneButton.node.name {
                transition(nextScene: SecondScene(size: SKVIEW.frame.size), currentScene: self)
            }
        }
    }
    
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY * 1.7)
        addChild(title)
    }
    
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 2.5)
        footer.fontSize = MAIN_BODY_SIZE_FONT
        footer.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 30
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    private func addText() {
        text.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nSo... Let's talk about Depression?"
        text.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 4)
        text.fontSize = MAIN_BODY_SIZE_FONT
        text.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 30
        text.numberOfLines = 4
        text.alpha = 0
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
