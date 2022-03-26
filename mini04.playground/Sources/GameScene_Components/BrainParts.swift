import SpriteKit

public class Brain {

    //Attributes
    public var backBrainNode = SKSpriteNode(imageNamed: backBrainSpriteName)
    public var seratoninNode = SKSpriteNode(imageNamed: seratoninSpriteName)
    public var dopamineNode = SKSpriteNode(imageNamed: dopamineSpriteName)
    public var noradrenalineNode = SKSpriteNode(imageNamed: noradrenalineSpriteName)
    public var frontBrainNode = SKSpriteNode(imageNamed: frontBrainSpriteName)

    //Methods
    public func addBrain(skScene: SKScene) {
        self.backBrainNode.position = CGPoint(x: skScene.frame.midX, y: skScene.frame.midY)
        self.backBrainNode.zPosition = 0
        self.frontBrainNode.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        self.frontBrainNode.zPosition = 4
        
        
        skScene.addChild(self.backBrainNode)
        skScene.addChild(self.frontBrainNode)
    }
    
    public func addSeratotin(skScene: SKScene) {
        self.seratoninNode.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        self.seratoninNode.zPosition = 1
        
        skScene.addChild(self.seratoninNode)
    }
    
    public func addDopamine(skScene: SKScene) {
        self.dopamineNode.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        self.dopamineNode.zPosition = 2
        
        skScene.addChild(self.dopamineNode)
    }
    
    public func addNoradrenaline(skScene: SKScene) {
        self.noradrenalineNode.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        self.noradrenalineNode.zPosition = 3
        
        skScene.addChild(self.noradrenalineNode)
    }
}
