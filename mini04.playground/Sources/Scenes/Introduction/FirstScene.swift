import SpriteKit

public class FirstScene: SKScene {
    
    private var brain = Brain()
    private var title = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private var footer = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private var text = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let touchDetector = skView.scene?.name
        let scaleUp = SKAction.scale(by: 1.5, duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        
        if touchDetector != "Second scene" {
            title.run(fadeOut)
            footer.run(fadeOut)
            brain.backBrainNode.run(scaleUp)
            brain.frontBrainNode.run(scaleUp)
            delay(0.5, closure: {
                self.text.run(fadeIn)
            })
            
            skView.scene?.name = "Second scene"
        } else {
            transition(nextScene: SecondScene(size: skView.frame.size), currentScene: self)
        }
        
    }

    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        brain.addBrain(skScene: self)
        addTitleText()
        addFooterText()
        addText()
    }
    
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.7)
        addChild(title)
    }
    
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 2.5)
        footer.fontSize = 20
        footer.preferredMaxLayoutWidth = skView.frame.size.width - 30
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    private func addText() {
        text.text = "Have you ever thought what could happen if mental health was not properly cared for and monitored?\n\nSo... Let's talk about Depression?"
        text.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 4)
        text.fontSize = 20
        text.preferredMaxLayoutWidth = skView.frame.size.width - 30
        text.numberOfLines = 4
        text.alpha = 0
        addChild(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
