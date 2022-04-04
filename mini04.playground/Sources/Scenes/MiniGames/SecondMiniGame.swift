import SpriteKit

public class SecondMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextButtonScene = NextSceneButton()
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let bacon = Bacon()
    private let chocolate = Chocolate()
    private let donut = Donut()
    private let eggs = Eggs()
    private let fries = Fries()
    private let soda = Soda()
    private let shelfTop = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    private let shelfBottom = SKSpriteNode(imageNamed: SHELF_NODE_TX)
    
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextButtonScene.addButton(skScene: self)
        addTutorialText()
        addFoodNodes()
    }
    
    public override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let moveUp = SKAction.move(to: CGPoint(x: SKVIEW.frame.minX + 20, y: SKVIEW.frame.maxY - 50), duration: 0.5)
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
                    self.bacon.node.run(fadeIn)
                    self.chocolate.node.run(fadeIn)
                    self.donut.node.run(fadeIn)
                    self.eggs.node.run(fadeIn)
                    self.fries.node.run(fadeIn)
                    self.soda.node.run(fadeIn)
                    self.shelfTop.run(fadeIn)
                    self.shelfBottom.run(fadeIn)
                })
            }
            
            switch clickNode.name {
            case HEALTHY_FOOD_NODE_NM:
                correctOption(with: clickNode)
                
            case UNHEALTHY_FOOD_NODE_NM:
                wrongOption(with: clickNode)
                
            default: break
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
    
    private func correctOption(with node: SKNode) {
        let moveToCenter = SKAction.move(to: CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY), duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 0.25)
        let fadeHalfAlhpa = SKAction.fadeAlpha(by: 1.0, duration: 0.25)
        
        node.run(fadeOut)
        delay(1.0, closure: {
            self.tutorialText.run(fadeOut)
            self.bacon.node.run(fadeOut)
            self.chocolate.node.run(fadeOut)
            self.donut.node.run(fadeOut)
            self.eggs.node.run(fadeOut)
            self.fries.node.run(fadeOut)
            self.soda.node.run(fadeOut)
            self.shelfTop.run(fadeOut)
            self.shelfBottom.run(fadeOut)
            delay(fadeOut.duration, closure: {
                self.brain.backBrainNode.run(moveToCenter)
                self.brain.frontBrainNode.run(moveToCenter)
                self.brain.serotoninNode.run(moveToCenter)
                self.brain.dopamineNode.run(moveToCenter)
                self.brain.noradrenalineNode.run(moveToCenter)
                delay(moveToCenter.duration + 0.5, closure: {
                    self.brain.dopamineNode.run(fadeHalfAlhpa)
                    delay(fadeHalfAlhpa.duration + 0.5, closure: {
                        transition(nextScene: ThirdMiniGameScene(size: SKVIEW.frame.size), currentScene: self)
                    })
                })
            })
        })
    }
    
    private func wrongOption(with node: SKNode) {
        let shake = SKAction.shake(initialPosition: node.position, duration: 0.5)
        
        node.run(shake)
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
        tutorialText.text = "Now let's get the Dopamine that Bruno needs!\nHe must have a balanced Diet"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = MAIN_SUBTITLE_SIZE_FONT
        tutorialText.position = CGPoint(x: (SKVIEW.frame.midX * 1.35) - 30 , y: SKVIEW.frame.midY * 1.5)
        addChild(tutorialText)
    }
    
    private func addFoodNodes() {
        //Top shelf
        addTopShelf(at_X: SKVIEW.frame.midX, at_Y: SKVIEW.frame.midY / 1.5)
        
        eggs.addFood(skScene: self)
        eggs.node.alpha = 0
        eggs.node.position = CGPoint(x: shelfTop.frame.midX / 2, y: shelfTop.frame.midY)
        
        fries.addFood(skScene: self)
        fries.node.alpha = 0
        fries.node.position = CGPoint(x: shelfTop.frame.midX, y: eggs.node.frame.minY)
        
        soda.addFood(skScene: self)
        soda.node.alpha = 0
        soda.node.position = CGPoint(x: shelfTop.frame.midX * 1.5, y: eggs.node.frame.minY)
        
        //Bottom shelf
        addBottomShelf(at_X: SKVIEW.frame.midX, at_Y: SKVIEW.frame.midY / 4.5)
        
        bacon.addFood(skScene: self)
        bacon.node.alpha = 0
        bacon.node.position = CGPoint(x: shelfBottom.frame.midX / 2, y: shelfBottom.frame.midY)
        
        donut.addFood(skScene: self)
        donut.node.alpha = 0
        donut.node.position = CGPoint(x: shelfBottom.frame.midX, y: bacon.node.frame.minY)
        
        chocolate.addFood(skScene: self)
        chocolate.node.alpha = 0
        chocolate.node.position = CGPoint(x: shelfBottom.frame.midX * 1.5, y: bacon.node.frame.minY)
    }
    
    private func addTopShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfTop.position = CGPoint(x: xPosition, y: yPosition)
        shelfTop.alpha = 0
        shelfTop.zPosition = -1
        addChild(shelfTop)
    }
    
    private func addBottomShelf(at_X xPosition: CGFloat, at_Y yPosition: CGFloat) {
        shelfBottom.position = CGPoint(x: xPosition, y: yPosition)
        shelfBottom.alpha = 0
        shelfBottom.zPosition = -1
        addChild(shelfBottom)
    }
}
