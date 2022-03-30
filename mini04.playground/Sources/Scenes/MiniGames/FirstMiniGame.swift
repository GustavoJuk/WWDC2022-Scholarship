import SpriteKit

public class FirstMiniGameScene: SKScene {
    
    private let title = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private let text = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let tutorialText = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private let exerciseButton = ExerciseButton()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        createTitle()
        createText()
    }
    
    public override func mouseUp(with event: NSEvent) {
        let touchDetector = skView.scene?.name
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        let fadeAlphaHalf = SKAction.fadeAlpha(to: 0.5, duration: 0.25)
        let scaleUp = SKAction.scale(by: 2.0, duration: 0.25)
        let moveUp = SKAction.move(to: CGPoint(x: skView.frame.maxX - (brain.backBrainNode.frame.size.width / 4), y: skView.frame.maxY - (brain.backBrainNode.frame.size.height / 2)), duration: 0.5)
        
        if touchDetector != "Second Game Scene" {
            brain.serotoninNode.run(fadeAlphaHalf)
            brain.dopamineNode.run(fadeAlphaHalf)
            brain.noradrenalineNode.run(fadeAlphaHalf)
            
            skView.scene?.name = "Second Game Scene"
        } else {
            title.run(fadeOut)
            text.run(fadeOut)
            nextSceneButton.circle.run(fadeOut)
            delay(fadeOut.duration, closure: {
                self.title.removeFromParent()
                self.text.removeFromParent()
            })
            brain.backBrainNode.run(moveUp)
            brain.frontBrainNode.run(moveUp)
            brain.serotoninNode.run(moveUp)
            brain.dopamineNode.run(moveUp)
            brain.noradrenalineNode.run(moveUp)
            delay(moveUp.duration, closure: {
                self.brain.backBrainNode.run(scaleUp)
                self.brain.frontBrainNode.run(scaleUp)
                self.brain.serotoninNode.run(scaleUp)
                self.brain.dopamineNode.run(scaleUp)
                self.brain.noradrenalineNode.run(scaleUp)
                self.createTutorialText()
                delay(scaleUp.duration, closure: {
                    self.brain.serotoninNode.run(fadeAlphaHalf)
                    self.tutorialText.run(fadeIn)
                    self.brain.addBrain(skScene: self)
                    self.brain.backBrainNode.scale(to: CGSize(width: self.brain.backBrainNode.frame.width / 2, height: self.brain.backBrainNode.frame.height / 2))
                    self.brain.backBrainNode.position = CGPoint(x: skView.frame.midX - (skView.frame.midX / 1.5), y: skView.frame.midY - (skView.frame.midY / 1.5))
                    self.brain.frontBrainNode.scale(to: CGSize(width: self.brain.backBrainNode.frame.width, height: self.brain.backBrainNode.frame.height))
                    self.brain.frontBrainNode.position = self.brain.backBrainNode.position
                    self.addButtonNode()
                })
            })
        }
    }
    
    private func addButtonNode() {
        exerciseButton.addButton(skScene: self)
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 1.5)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
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
        tutorialText.preferredMaxLayoutWidth = skView.frame.size.width - 50
        tutorialText.numberOfLines = 3
        tutorialText.fontSize = 20
        tutorialText.position = CGPoint(x: skView.frame.minX + (tutorialText.frame.size.width / 2), y: skView.frame.maxY - (brain.backBrainNode.frame.size.height / 2))
        addChild(tutorialText)
    }
}
