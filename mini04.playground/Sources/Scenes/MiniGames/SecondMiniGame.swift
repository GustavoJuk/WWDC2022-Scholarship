import SpriteKit

public class SecondMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextButtonScene = NextSceneButton()
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let dietNode1 = DietButton()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextButtonScene.addButton(skScene: self)
        addTutorialText()
        addButtonsNodes()
    }
    
    public override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let moveUp = SKAction.move(to: CGPoint(x: SKVIEW.frame.minX + 50, y: SKVIEW.frame.maxY - 50), duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextButtonScene.node.name {
                nextButtonScene.node.setScale(0.75)
                nextButtonScene.node.alpha = 0.5
                brain.backBrainNode.run(moveUp)
                brain.frontBrainNode.run(moveUp)
                brain.serotoninNode.run(moveUp)
                brain.dopamineNode.run(moveUp)
                brain.noradrenalineNode.run(moveUp)
                delay(moveUp.duration, closure: {
                    self.nextButtonScene.node.run(fadeOut)
                    self.tutorialText.run(fadeIn)
                    self.dietNode1.node.run(fadeIn)
                })
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickedNode in nodes(at: location) {
            if clickedNode.name == nextButtonScene.node.name {
                nextButtonScene.node.setScale(1.0)
                nextButtonScene.node.alpha = 1.0
            }
        }
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width * 2.0, height: brain.backBrainNode.frame.height * 2.0))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.serotoninNode.alpha = 1.0
        brain.dopamineNode.alpha = 0.25
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func addTutorialText() {
        tutorialText.text = "Now let's the Dopamine that Bruno needs!\nLet's get a balanced Diet"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = 20
        tutorialText.position = CGPoint(x: SKVIEW.frame.midX * 1.35 , y: SKVIEW.frame.midY * 1.5)
        addChild(tutorialText)
    }
    
    private func addButtonsNodes() {
        dietNode1.addButton(skScene: self)
        
        dietNode1.node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 1.5)
        dietNode1.node.alpha = 0
    }
}
