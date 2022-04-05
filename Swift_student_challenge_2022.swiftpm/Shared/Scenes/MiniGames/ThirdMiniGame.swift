import SpriteKit

public class ThirdMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextSceneButton = NextSceneButton()
    private let tutorialText = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let sleepButton = SleepButton()
    private let sleepGraphic = SleepGraphic()
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextSceneButton.addButton(skScene: self)
        addTutorialText()
        sleepButton.addButton(skScene: self)
        sleepGraphic.addGraphic(skScene: self)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            if nextSceneButton.node.contains(location) {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                brain.backBrainNode.run(moveToNoradrenalineSide)
                brain.frontBrainNode.run(moveToNoradrenalineSide)
                brain.serotoninNode.run(moveToNoradrenalineSide)
                brain.dopamineNode.run(moveToNoradrenalineSide)
                brain.noradrenalineNode.run(moveToNoradrenalineSide)
                nextSceneButton.node.run(fadeOut)
                delay(moveToNoradrenalineSide.duration, closure: {
                    self.tutorialText.run(fadeIn)
                    self.sleepButton.node.run(fadeIn)
                    self.sleepGraphic.graphic.run(fadeIn)
                    self.sleepGraphic.safeArea.run(fadeIn)
                    self.sleepGraphic.graphBackground.run(fadeAlphaInHalf)
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
        brain.dopamineNode.alpha = 1.0
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
    
    private func addTutorialText() {
        tutorialText.text = "The last part is Bruno's Noradrenaline.\nHelp him getting a good amount of Sleep!"
        tutorialText.alpha = 0
        tutorialText.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 50
        tutorialText.numberOfLines = 2
        tutorialText.fontSize = MAIN_BODY_SIZE_FONT
        tutorialText.position = CGPoint(x: MYVIEW.frame.maxX - (tutorialText.frame.width / 2) - 30, y: MYVIEW.frame.minY + (tutorialText.frame.height / 2))
        addChild(tutorialText)
    }
}
