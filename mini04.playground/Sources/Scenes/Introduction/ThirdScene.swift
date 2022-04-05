import SpriteKit

public class ThirdScene: SKScene {
    
    private let article = SKLabelNode(fontNamed: "\(MAIN_FONT) - Bold")
    private let nextSceneButton = NextSceneButton()
    private let seratonin = SerotoninGraphic()
    private let dopamine = DopamineGraphic()
    private let noradrenaline = NoradrenalineGraphic()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = BACKGROUND_COLOR
        addText()
        nextSceneButton.addButton(skScene: self)
        seratonin.addGraphic(skScene: self)
        dopamine.addGraphic(skScene: self)
        noradrenaline.addGraphic(skScene: self)
    }
    
    public override func mouseDown(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(1.0)
                nextSceneButton.node.alpha = 1.0
                transition(nextScene: FirstMiniGameScene(size: MYVIEW.frame.size), currentScene: self)
            }
        }
    }
    
    private func addText() {
        article.text = "To sum up, what happens in the brain of a deprressed person is the decrease of the neurotransmitters witch are responsable to funcitons like humor regulation, sleep, motivation and energy."
        article.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY * 1.5)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = MYVIEW.frame.size.width - 30
        article.numberOfLines = 10
        addChild(article)
    }    
}
