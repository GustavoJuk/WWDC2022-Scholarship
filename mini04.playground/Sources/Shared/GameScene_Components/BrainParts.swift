import SpriteKit

public class Brain: SKNode {
    
    //Attributes
    public var backBrainNode: SKSpriteNode {
        let backBrain = SKSpriteNode(imageNamed: backBrainSpriteName)
        backBrain.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.25)
        backBrain.scale(to: CGSize(width: backBrain.frame.width / 1.5, height: backBrain.frame.height / 1.5))
        backBrain.zPosition = -5
    
        return backBrain
    }
    
    public var serotoninNode: SKSpriteNode {
        let serotonin = SKSpriteNode(imageNamed: seratoninSpriteName)
        serotonin.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        serotonin.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        serotonin.zPosition = -4
        
        return serotonin
    }
    
    public var dopamineNode: SKSpriteNode {
        let dopamine = SKSpriteNode(imageNamed: dopamineSpriteName)
        dopamine.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        dopamine.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        dopamine.zPosition = -3
        
        return dopamine
    }
    
    public var noradrenalineNode: SKSpriteNode {
        let noradrenaline = SKSpriteNode(imageNamed: noradrenalineSpriteName)
        noradrenaline.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        noradrenaline.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        noradrenaline.zPosition = -2
        
        return noradrenaline
    }
    
    
    public var frontBrainNode: SKSpriteNode {
        let frontBrain = SKSpriteNode(imageNamed: frontBrainSpriteName)
        frontBrain.position = CGPoint(x: backBrainNode.frame.midX, y: backBrainNode.frame.midY)
        frontBrain.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        frontBrain.zPosition = -1
        
        return frontBrain
    }
       
    //Methods
    public func addBrain(skScene: SKScene) {
        skScene.addChild(self.backBrainNode)
        skScene.addChild(self.frontBrainNode)
    }
    
    public func addSeratotin(skScene: SKScene) {
        skScene.addChild(self.serotoninNode)
    }
    
    public func addDopamine(skScene: SKScene) {
        skScene.addChild(self.dopamineNode)
    }
    
    public func addNoradrenaline(skScene: SKScene) {
        skScene.addChild(self.noradrenalineNode)
    }
}
