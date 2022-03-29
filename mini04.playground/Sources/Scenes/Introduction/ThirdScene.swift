import SpriteKit

public class ThirdScene: SKScene {
    private let article = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private let serotonin = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let dopamine = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let noradrenaline = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let sGraphic = SKSpriteNode(color: serotoninColor, size: CGSize(width: 30, height: 200))
    private let dGraphic = SKSpriteNode(color: dopamineColor, size: CGSize(width: 30, height: 200))
    private let nGraphic = SKSpriteNode(color: noradrenalineColor, size: CGSize(width: 30, height: 200))
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = backGroundColor
        addText()
        createSerotoninGraphic()
        createDopamineGraphic()
        createNoradrenalineGraphic()
    }
    
    public override func mouseUp(with event: NSEvent) {
        transition(nextScene: FirstMiniGameScene(size: skView.frame.size), currentScene: self)
    }
    
    private func addText() {
        article.text = "To sum up, what happens in the brain of a deprressed person is the decrease of the neurotransmitters witch are responsable to funcitons like humor regulation, sleep, motivation and energy."
        article.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.5)
        article.fontSize = 20
        article.preferredMaxLayoutWidth = skView.frame.size.width - 30
        article.numberOfLines = 10
        addChild(article)
    }
    
    private func createSerotoninGraphic() {
        serotonin.text = serotoninSpriteName
        serotonin.fontColor = serotoninColor
        serotonin.position = CGPoint(x: skView.frame.midX - (serotonin.frame.width * 1.5), y: skView.frame.midY / 3)
        sGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        sGraphic.position = CGPoint(x: serotonin.frame.midX, y: serotonin.frame.maxY + 10)
        let scaleDown = SKAction.scale(by: 0.5, duration: 1.0)
        sGraphic.run(scaleDown)
        addChild(serotonin)
        addChild(sGraphic)
    }
    
    private func createDopamineGraphic() {
        dopamine.text = dopamineSpriteName
        dopamine.fontColor = dopamineColor
        dopamine.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 3)
        dGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        dGraphic.position = CGPoint(x: dopamine.frame.midX, y: dopamine.frame.maxY + 10)
        let scaleDown = SKAction.scale(by: 0.2, duration: 1.0)
        dGraphic.run(scaleDown)
        addChild(dopamine)
        addChild(dGraphic)
    }
    
    private func createNoradrenalineGraphic() {
        noradrenaline.text = noradrenalineSpriteName
        noradrenaline.fontColor = noradrenalineColor
        noradrenaline.position = CGPoint(x: skView.frame.midX + (serotonin.frame.width * 1.5), y: skView.frame.midY / 3)
        nGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        nGraphic.position = CGPoint(x: noradrenaline.frame.midX, y: noradrenaline.frame.maxY + 10)
        let scaleDown = SKAction.scale(by: 0.3, duration: 1.0)
        nGraphic.run(scaleDown)
        addChild(noradrenaline)
        addChild(nGraphic)
    }
    
}
