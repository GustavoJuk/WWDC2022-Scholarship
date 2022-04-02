import SpriteKit

public class FirstMiniGameScene: SKScene, SKPhysicsContactDelegate {
    
    private let title = SKLabelNode(fontNamed: "\(MAIN_FONT) - Bold")
    private let text = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let finishLine = SKShapeNode(rect: CGRect(origin: CGPoint(x: SKVIEW.frame.midX * 1.75, y: (SKVIEW.frame.midY - (SKVIEW.frame.midY / 1.5) - 50)), size: CGSize(width: 15, height: 100)))
    private let brain = Brain()
    private let secondBrain = SKSpriteNode(imageNamed: FULL_BRAIN_NODE_TX)
    private let nextSceneButton = NextSceneButton()
    private let exerciseButton = ExerciseButton()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = BACKGROUND_COLOR
        physicsWorld.contactDelegate = self
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        createTitle()
        createText()
    }
    
    public override func mouseDown(with event: NSEvent) {
        
        let location = event.location(in: self)
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 0.25)
        let fadeAlphaHalf = SKAction.fadeAlpha(to: 0.25, duration: 0.25)
        let scaleUp = SKAction.scale(by: 2.0, duration: 0.25)
        let moveUp = SKAction.move(to: CGPoint(x: SKVIEW.frame.maxX - (brain.backBrainNode.frame.size.width / 4), y: SKVIEW.frame.maxY - (brain.backBrainNode.frame.size.height / 2)), duration: 0.5)
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                brain.serotoninNode.run(fadeAlphaHalf)
                brain.dopamineNode.run(fadeAlphaHalf)
                brain.noradrenalineNode.run(fadeAlphaHalf)
                title.run(fadeOut)
                text.run(fadeOut)
                nextSceneButton.node.run(fadeOut)
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
                                self.exerciseButton.node.run(fadeIn)
                                self.addFullBrainNode()
                                self.secondBrain.run(fadeIn)
                                self.addFinishLine()
                                self.finishLine.run(fadeIn)
                            })
                        })
                    })
                })
            }
            
            if clickNode.name == exerciseButton.node.name {
                exerciseButton.node.setScale(0.75)
                secondBrain.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0))
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        let location = event.location(in: self)
        
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(1.0)
                nextSceneButton.node.alpha = 1.0
            }
            if clickNode.name == exerciseButton.node.name {
                exerciseButton.node.setScale(1.0)
            }
        }
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let moveToCenter = SKAction.move(to: CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY), duration: 0.5)
        let fadeAlphaHalf = SKAction.fadeAlpha(to: 1.0, duration: 0.25)

        if contact.bodyA.node?.name == FULL_BRAIN_NODE_TX {
            secondBrain.physicsBody?.isDynamic = false
            secondBrain.run(fadeOut)
            finishLine.run(fadeOut)
            delay(fadeOut.duration + 0.5, closure: {
                self.secondBrain.removeFromParent()
                self.finishLine.removeFromParent()
                self.exerciseButton.node.run(fadeOut)
                self.tutorialText.run(fadeOut)
                delay(fadeOut.duration, closure: {
                    self.exerciseButton.node.removeFromParent()
                    self.tutorialText.removeFromParent()
                    delay(fadeOut.duration, closure: {
                        self.brain.backBrainNode.run(moveToCenter)
                        self.brain.frontBrainNode.run(moveToCenter)
                        self.brain.serotoninNode.run(moveToCenter)
                        self.brain.dopamineNode.run(moveToCenter)
                        self.brain.noradrenalineNode.run(moveToCenter)
                        delay(moveToCenter.duration + 0.5, closure: {
                            self.brain.serotoninNode.run(fadeAlphaHalf)
                            delay(fadeAlphaHalf.duration + 0.5, closure: {
                                transition(nextScene: SecondMiniGameScene(size: SKVIEW.frame.size), currentScene: self)
                            })
                        })
                    })
                })
            })
        }
    }
    
    public override func mouseEntered(with event: NSEvent) {
        let location = event.location(in: self)
        
        for clickedNode in nodes(at: location) {
            if clickedNode.name == EXERCISE_BUTTON_NODE_NM {
                exerciseButton.node.setScale(1.15)
            }
        }
    }
    
    private func addFullBrainNode() {
        secondBrain.name = FULL_BRAIN_NODE_TX
        secondBrain.scale(to: CGSize(width: secondBrain.frame.width / 2, height: secondBrain.frame.height / 2))
        secondBrain.position = CGPoint(x: SKVIEW.frame.midX - (SKVIEW.frame.midX / 1.5), y: SKVIEW.frame.midY - (SKVIEW.frame.midY / 1.5))
        secondBrain.alpha = 0
        secondBrain.physicsBody = SKPhysicsBody(texture: secondBrain.texture!, size: secondBrain.size)
        secondBrain.physicsBody?.affectedByGravity = false
        secondBrain.physicsBody?.allowsRotation = false
        secondBrain.physicsBody?.categoryBitMask = CollisionType.brain.rawValue
        secondBrain.physicsBody?.collisionBitMask = CollisionType.finishLine.rawValue
        secondBrain.physicsBody?.contactTestBitMask = CollisionType.finishLine.rawValue
        
        addChild(secondBrain)
    }
    
    private func addButtonNode() {
        exerciseButton.addButton(skScene: self)
        exerciseButton.alpha = 0
    }
    
    private func addFinishLine() {
        finishLine.name = "Finish line"
        finishLine.fillColor = .white
        finishLine.physicsBody = SKPhysicsBody(rectangleOf: finishLine.frame.size, center: CGPoint(x: finishLine.frame.midX, y: finishLine.frame.midY))
        finishLine.physicsBody?.allowsRotation = false
        finishLine.physicsBody?.affectedByGravity = false
        finishLine.physicsBody?.categoryBitMask = CollisionType.finishLine.rawValue
        
        addChild(finishLine)
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 1.5)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func createTitle() {
        title.text = "With this in mind, let's help Bruno?"
        title.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY * 1.7)
        addChild(title)
    }
    
    private func createText() {
        text.text = "Bruno has a serious depression history in his family and some of the symptoms manifested recently."
        text.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY * 1.25)
        text.fontSize = 20
        text.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 30
        text.numberOfLines = 2
        addChild(text)
    }
    
    private func createTutorialText() {
        tutorialText.text = "The level of Serotonin in Brunos's brains is very low!\nQuick! Help him by doing some Exercise"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 3
        tutorialText.fontSize = 20
        tutorialText.position = CGPoint(x: SKVIEW.frame.minX + (tutorialText.frame.size.width / 2), y: SKVIEW.frame.maxY - (brain.backBrainNode.frame.size.height / 2))
        addChild(tutorialText)
    }
}
