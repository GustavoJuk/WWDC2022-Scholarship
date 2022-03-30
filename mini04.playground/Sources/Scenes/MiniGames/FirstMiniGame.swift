import SpriteKit

public class FirstMiniGameScene: SKScene {
    
    private let title = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private let text = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let tutorialText = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let brain = Brain()
    private let secondBrain = Brain()
    private let nextSceneButton = NextSceneButton()
    private let exerciseButton = ExerciseButton()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        createTitle()
        createText()
    }
    
    public override func mouseDown(with event: NSEvent) {
        
        let location = event.location(in: self)
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        let fadeAlphaHalf = SKAction.fadeAlpha(to: 0.5, duration: 0.25)
        let scaleUp = SKAction.scale(by: 2.0, duration: 0.25)
        let moveUp = SKAction.move(to: CGPoint(x: skView.frame.maxX - (brain.backBrainNode.frame.size.width / 4), y: skView.frame.maxY - (brain.backBrainNode.frame.size.height / 2)), duration: 0.5)
        
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.buttonNode.name {
                brain.serotoninNode.run(fadeAlphaHalf)
                brain.dopamineNode.run(fadeAlphaHalf)
                brain.noradrenalineNode.run(fadeAlphaHalf)
                title.run(fadeOut)
                text.run(fadeOut)
                nextSceneButton.buttonNode.run(fadeOut)
                delay(fadeOut.duration, closure: {
                    self.title.removeFromParent()
                    self.text.removeFromParent()
                    delay(fadeOut.duration, closure: {
                        self.brain.backBrainNode.run(moveUp)
                        self.brain.frontBrainNode.run(moveUp)
                        self.brain.serotoninNode.run(moveUp)
                        self.brain.dopamineNode.run(moveUp)
                        self.brain.noradrenalineNode.run(moveUp)
                        delay(moveUp.duration, closure: {
                            self.brain.backBrainNode.run(scaleUp)
                            self.brain.frontBrainNode.run(scaleUp)
                            self.brain.serotoninNode.run(scaleUp)
                            self.brain.dopamineNode.run(scaleUp)
                            self.brain.noradrenalineNode.run(scaleUp)
                            self.createTutorialText()
                            delay(scaleUp.duration, closure: {
                                self.tutorialText.run(fadeIn)
                                self.addButtonNode()
                                self.exerciseButton.alpha = 0
                                self.exerciseButton.node.run(fadeIn)
                                self.secondBrain.addBrain(skScene: self)
                                self.secondBrain.backBrainNode.scale(to: CGSize(width: self.secondBrain.backBrainNode.frame.width / 2, height: self.secondBrain.backBrainNode.frame.height / 2))
                                self.secondBrain.backBrainNode.position = CGPoint(x: skView.frame.midX - (skView.frame.midX / 1.5), y: skView.frame.midY - (skView.frame.midY / 1.5))
                                self.secondBrain.backBrainNode.alpha = 0
                                self.secondBrain.backBrainNode.physicsBody = SKPhysicsBody(texture: self.secondBrain.backBrainNode.texture!, size: self.secondBrain.backBrainNode.size)
                                self.secondBrain.backBrainNode.physicsBody?.affectedByGravity = false
                                self.secondBrain.backBrainNode.physicsBody?.allowsRotation = false
                                self.secondBrain.backBrainNode.run(fadeIn)
                                self.secondBrain.frontBrainNode.scale(to: CGSize(width: self.secondBrain.backBrainNode.frame.width, height: self.secondBrain.backBrainNode.frame.height))
                                self.secondBrain.frontBrainNode.position = self.secondBrain.backBrainNode.position
                                self.secondBrain.frontBrainNode.alpha = 0
                                self.secondBrain.frontBrainNode.physicsBody = SKPhysicsBody(texture: self.secondBrain.frontBrainNode.texture!, size: self.secondBrain.frontBrainNode.size)
                                self.secondBrain.frontBrainNode.physicsBody?.affectedByGravity = false
                                self.secondBrain.frontBrainNode.physicsBody?.allowsRotation = false
                                self.secondBrain.frontBrainNode.run(fadeIn)
                            })
                        })
                    })
                })
            }
            if clickNode.name == exerciseButton.node.name {
                secondBrain.backBrainNode.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
                secondBrain.frontBrainNode.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
            }
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
