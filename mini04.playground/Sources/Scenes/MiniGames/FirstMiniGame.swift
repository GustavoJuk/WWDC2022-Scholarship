import SpriteKit

public class FirstMiniGameScene: SKScene {
    private let title = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private let text = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let brain = Brain()
    private let tutorialText = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        addBrainNodes()
        createTitle()
        createText()
    }
    
    public override func mouseUp(with event: NSEvent) {
        let touchDetector = skView.scene?.name
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        let move = SKAction.move(to: CGPoint(x: skView.frame.midX, y: skView.frame.maxY - (brain.backBrainNode.frame.size.width / 1.5)), duration: 0.5)
        
        if touchDetector != "Second Game Scene" {
            brain.serotoninNode.run(fadeOut)
            brain.dopamineNode.run(fadeOut)
            brain.noradrenalineNode.run(fadeOut)
            delay(0.25, closure: {
                self.brain.serotoninNode.alpha = 0
                self.brain.dopamineNode.alpha = 0
                self.brain.noradrenalineNode.alpha = 0
            })
            
            skView.scene?.name = "Second Game Scene"
        } else {
            title.run(fadeOut)
            text.run(fadeOut)
            delay(0.25, closure: {
                self.title.removeFromParent()
                self.text.removeFromParent()
            })
            brain.backBrainNode.run(move)
            brain.frontBrainNode.run(move)
            brain.serotoninNode.run(move)
            brain.dopamineNode.run(move)
            brain.noradrenalineNode.run(move)
            createTutorialText()
            delay(0.25, closure: {
                
                self.tutorialText.run(fadeIn)
            })
        }
    }
    
    private func addBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 1.5)
        brain.frontBrainNode.position = CGPoint(x: brain.backBrainNode.position.x, y: brain.backBrainNode.position.y)
        brain.serotoninNode.position = CGPoint(x: brain.backBrainNode.position.x, y: brain.backBrainNode.position.y)
        brain.dopamineNode.position = CGPoint(x: brain.backBrainNode.position.x, y: brain.backBrainNode.position.y)
        brain.noradrenalineNode.position = CGPoint(x: brain.backBrainNode.position.x, y: brain.backBrainNode.position.y)
    }
    
    private func createTitle() {
        title.text = "With this in mind, let's help Bruno?"
        title.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.7)
        addChild(title)
    }
    
    private func createText() {
        text.text = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
        text.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.25)
        text.fontSize = 20
        text.preferredMaxLayoutWidth = skView.frame.size.width - 30
        text.numberOfLines = 2
        addChild(text)
    }
    
    private func createTutorialText() {
        tutorialText.text = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = skView.frame.size.width - 30
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = 20
        tutorialText.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.005)
        addChild(tutorialText)
    }
}
