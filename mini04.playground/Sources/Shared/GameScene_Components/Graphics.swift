import SpriteKit

public class SerotoninGraphic: SKNode {
    
    //Attributes
    private let serotonin = SEROTONIN_TITLE_TEXT
    private let sGraphic = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: 30, height: 200))
        
    //Methods
    public func addSerotoninGraphic(skScene: SKScene) {
        serotonin.position = CGPoint(x: SKVIEW.frame.midX - (serotonin.frame.width * 1.5), y: SKVIEW.frame.midY / 3)
        sGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        sGraphic.position = CGPoint(x: serotonin.frame.midX, y: serotonin.frame.maxY + 10)
        sGraphic.run(scaleSerotoninDown)
        skScene.addChild(serotonin)
        skScene.addChild(sGraphic)
    }
}

public class DopamineGraphic: SKNode {
    
    //Attributes
    private let dopamine = DOPAMINE_TITLE_TEXT
    private let dGraphic = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: 30, height: 200))
        
    //Methods
    public func addDopamineGraphic(skScene: SKScene) {        
        dopamine.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 3)
        dGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        dGraphic.position = CGPoint(x: dopamine.frame.midX, y: dopamine.frame.maxY + 10)
        dGraphic.run(scaleDopamineDown)
        skScene.addChild(dopamine)
        skScene.addChild(dGraphic)
    }
}

public class NoradrenalineGraphic: SKNode {
    
    //Attributes
    private let noradrenaline = NORADRENALINE_TITLE_TEXT
    private let nGraphic = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: 30, height: 200))
    
    //Methods
    public func addNoradrenalineGraphic(skScene: SKScene) {
        noradrenaline.position = CGPoint(x: SKVIEW.frame.midX + noradrenaline.frame.width, y: SKVIEW.frame.midY / 3)
        nGraphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        nGraphic.position = CGPoint(x: noradrenaline.frame.midX, y: noradrenaline.frame.maxY + 10)
        nGraphic.run(scaleNoradrenalineDown)
        skScene.addChild(noradrenaline)
        skScene.addChild(nGraphic)
    }
}
