import SpriteKit

public class ThirdScene: SKScene {
    
    private let article = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private let nextSceneButton = NextSceneButton()
    private let seratonin = SerotoninGraphic()
    private let dopamine = DopamineGraphic()
    private let noradrenaline = NoradrenalineGraphic()
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = backGroundColor
        addText()
        nextSceneButton.addButton(skScene: self)
        seratonin.addSerotoninGraphic(skScene: self)
        dopamine.addDopamineGraphic(skScene: self)
        noradrenaline.addNoradrenalineGraphic(skScene: self)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let location = event.location(in: self)
        for clickNode in nodes(at: location) {
            if clickNode.name == buttonNodeName {
                transition(nextScene: FirstMiniGameScene(size: skView.frame.size), currentScene: self)
            }
        }
    }
    
    private func addText() {
        article.text = "To sum up, what happens in the brain of a deprressed person is the decrease of the neurotransmitters witch are responsable to funcitons like humor regulation, sleep, motivation and energy."
        article.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.5)
        article.fontSize = 20
        article.preferredMaxLayoutWidth = skView.frame.size.width - 30
        article.numberOfLines = 10
        addChild(article)
    }    
}
