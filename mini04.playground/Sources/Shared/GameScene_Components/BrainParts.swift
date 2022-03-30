import SpriteKit

public class Brain: SKNode {
    
    //Attributes
    public var backBrainNode = SKSpriteNode()
    public var serotoninNode = SKSpriteNode()
    public var dopamineNode = SKSpriteNode()
    public var noradrenalineNode = SKSpriteNode()
    public var frontBrainNode = SKSpriteNode()
       
    //Initializers
    private func createBrain() {
        backBrainNode = SKSpriteNode(imageNamed: backBrainSpriteName)
        backBrainNode.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.25)
        backBrainNode.scale(to: CGSize(width: backBrainNode.frame.width / 1.5, height: backBrainNode.frame.height / 1.5))
        backBrainNode.zPosition = -5
        frontBrainNode = SKSpriteNode(imageNamed: frontBrainSpriteName)
        frontBrainNode.position = backBrainNode.position
        frontBrainNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        frontBrainNode.zPosition = -1
    }
    
    private func createSerotonin() {
        serotoninNode = SKSpriteNode(imageNamed: serotoninSpriteName)
        serotoninNode.position = backBrainNode.position
        serotoninNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        serotoninNode.zPosition = -4
    }
    
    private func createDopamine() {
        dopamineNode = SKSpriteNode(imageNamed: dopamineSpriteName)
        dopamineNode.position = backBrainNode.position
        dopamineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        dopamineNode.zPosition = -3
    }
    
    private func createNoradrenaline() {
        noradrenalineNode = SKSpriteNode(imageNamed: noradrenalineSpriteName)
        noradrenalineNode.position = backBrainNode.position
        noradrenalineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        noradrenalineNode.zPosition = -2
    }
    
    //Methods
    public func addBrain(skScene: SKScene) {
        createBrain()
        skScene.addChild(self.backBrainNode)
        skScene.addChild(self.frontBrainNode)
    }
    
    public func addSeratotin(skScene: SKScene) {
        createSerotonin()
        skScene.addChild(self.serotoninNode)
    }
    
    public func addDopamine(skScene: SKScene) {
        createDopamine()
        skScene.addChild(self.dopamineNode)
    }
    
    public func addNoradrenaline(skScene: SKScene) {
        createNoradrenaline()
        skScene.addChild(self.noradrenalineNode)
    }
}
