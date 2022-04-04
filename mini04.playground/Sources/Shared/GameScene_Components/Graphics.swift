import SpriteKit

public protocol Graph: SKNode {
    var node: SKLabelNode { get set }
    var graphic: SKSpriteNode { get set }
    
    func addGraphic(skScene: SKScene)
}

public class SerotoninGraphic: SKNode, Graph {
    
    //Attributes
    public var node = SEROTONIN_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: 30, height: 200))
        
    //Methods
    public func addGraphic(skScene: SKScene) {
        node.position = CGPoint(x: SKVIEW.frame.midX - (node.frame.width * 1.5), y: SKVIEW.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: node.frame.midX, y: node.frame.maxY + 10)
        graphic.run(scaleSerotoninDown)
        skScene.addChild(node)
        skScene.addChild(graphic)
    }
}

public class DopamineGraphic: SKNode, Graph {
    
    //Attributes
    public var node = DOPAMINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: 30, height: 200))
        
    //Methods
    public func addGraphic(skScene: SKScene) {        
        node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: node.frame.midX, y: node.frame.maxY + 10)
        graphic.run(scaleDopamineDown)
        skScene.addChild(node)
        skScene.addChild(graphic)
    }
}

public class NoradrenalineGraphic: SKNode, Graph {
    
    //Attributes
    public var node = NORADRENALINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: 30, height: 200))
    
    //Methods
    public func addGraphic(skScene: SKScene) {
        node.position = CGPoint(x: SKVIEW.frame.midX + node.frame.width, y: SKVIEW.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: node.frame.midX, y: node.frame.maxY + 10)
        graphic.run(scaleNoradrenalineDown)
        skScene.addChild(node)
        skScene.addChild(graphic)
    }
}

public class SleepGraphic: SKNode, Graph {
    
    //Attributes
    public var node = SLEEP_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: 20, height: 45))
    public var safeArea = SKSpriteNode(color: .green, size: CGSize(width: 120, height: 45))
    public var graphBackground = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: SKVIEW.frame.width - 100, height: 60))
    
    //Methods
    public func addGraphic(skScene: SKScene) {
        graphBackground.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.maxY - (graphic.frame.height / 2) - 30)
        graphBackground.alpha = 0
        graphBackground.zPosition = -2
        graphic.position = CGPoint(x: graphBackground.frame.minX + 20, y: graphBackground.frame.midY)
        graphic.alpha = 0
        safeArea.position = CGPoint(x: graphBackground.frame.maxX - safeArea.frame.height * 3, y: graphBackground.frame.midY)
        safeArea.alpha = 0
        skScene.addChild(graphic)
        skScene.addChild(safeArea)
        skScene.addChild(graphBackground)
    }
}
