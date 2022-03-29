import SpriteKit

public class SerotoninGraphic: SKNode {
    
    //Attributes
    private let serotonin = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let sGraphic = SKSpriteNode(color: serotoninColor, size: CGSize(width: 30, height: 200))
    
    //Initializers
    private func createSerotoninGraphic() {
        let scaleDown = SKAction.scale(by: 0.5, duration: 1.0)
        
        serotonin.text = serotoninSpriteName
        serotonin.fontColor = serotoninColor
        serotonin.position = CGPoint(x: skView.frame.midX - (serotonin.frame.width * 1.5), y: skView.frame.midY / 3)
        sGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        sGraphic.position = CGPoint(x: serotonin.frame.midX, y: serotonin.frame.maxY + 10)
        sGraphic.run(scaleDown)
    }
    
    //Methods
    public func addSerotoninGraphic(skScene: SKScene) {
        createSerotoninGraphic()
        skScene.addChild(serotonin)
        skScene.addChild(sGraphic)
    }
}

public class DopamineGraphic: SKNode {
    
    //Attributes
    private let dopamine = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let dGraphic = SKSpriteNode(color: dopamineColor, size: CGSize(width: 30, height: 200))
    
    //Initializers
    private func createDopamineGraphic() {
        let scaleDown = SKAction.scale(by: 0.2, duration: 1.0)
        
        dopamine.text = dopamineSpriteName
        dopamine.fontColor = dopamineColor
        dopamine.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 3)
        dGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        dGraphic.position = CGPoint(x: dopamine.frame.midX, y: dopamine.frame.maxY + 10)
        dGraphic.run(scaleDown)
    }
    
    //Methods
    public func addDopamineGraphic(skScene: SKScene) {
        createDopamineGraphic()
        skScene.addChild(dopamine)
        skScene.addChild(dGraphic)
    }
}

public class NoradrenalineGraphic: SKNode {
    
    //Attributes
    private let noradrenaline = SKLabelNode(fontNamed: "\(mainFontName) - Semi Bold")
    private let nGraphic = SKSpriteNode(color: noradrenalineColor, size: CGSize(width: 30, height: 200))
    
    //Initializers
    private func createNoradrenalineGraphic() {
        let scaleDown = SKAction.scale(by: 0.3, duration: 1.0)
        
        noradrenaline.text = noradrenalineSpriteName
        noradrenaline.fontColor = noradrenalineColor
        noradrenaline.position = CGPoint(x: skView.frame.midX + noradrenaline.frame.width, y: skView.frame.midY / 3)
        nGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        nGraphic.position = CGPoint(x: noradrenaline.frame.midX, y: noradrenaline.frame.maxY + 10)
        nGraphic.run(scaleDown)
    }
    
    //Methods
    public func addNoradrenalineGraphic(skScene: SKScene) {
        createNoradrenalineGraphic()
        skScene.addChild(noradrenaline)
        skScene.addChild(nGraphic)
    }
}
