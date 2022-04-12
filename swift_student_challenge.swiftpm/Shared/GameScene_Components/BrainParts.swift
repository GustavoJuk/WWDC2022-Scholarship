//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

/// This is class constructs the nodes of the brain
public class Brain: SKNode {
    
    //Attributes
    public var backBrainNode = SKSpriteNode()
    public var serotoninNode = SKSpriteNode()
    public var dopamineNode = SKSpriteNode()
    public var noradrenalineNode = SKSpriteNode()
    public var frontBrainNode = SKSpriteNode()
                
    //Methods
    /// This method constructs the brain view in the scene without the neurotransimitters
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addBrain(skScene: SKScene) {
        backBrainNode = SKSpriteNode(imageNamed: BACK_BRAIN_NODE_TX)
        backBrainNode.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.15)
        backBrainNode.scale(to: CGSize(width: myScene.bounds.size.width * 0.5, height: myScene.bounds.size.height * 0.5))
        backBrainNode.scene?.scaleMode = .resizeFill
        backBrainNode.zPosition = -5
        backBrainNode.name = BACK_BRAIN_NODE_NM
        frontBrainNode = SKSpriteNode(imageNamed: FRONT_BRAIN_NODE_TX)
        frontBrainNode.position = backBrainNode.position
        frontBrainNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        frontBrainNode.scene?.scaleMode = backBrainNode.scene!.scaleMode
        frontBrainNode.zPosition = -1
        frontBrainNode.name = FRONT_BRAIN_NODE_NM
        skScene.addChild(self.backBrainNode)
        skScene.addChild(self.frontBrainNode)
    }
    
    /// This method constructs the Serotonin node in the scene
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addSeratotin(skScene: SKScene) {
        serotoninNode = SKSpriteNode(imageNamed: SEROTONIN_NODE_TX)
        serotoninNode.position = backBrainNode.position
        serotoninNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        serotoninNode.zPosition = -4
        serotoninNode.name = SEROTONIN_BRAIN_NODE_NM
        skScene.addChild(self.serotoninNode)
    }
    
    /// This method constructs the Dopamine node in the scene
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addDopamine(skScene: SKScene) {
        dopamineNode = SKSpriteNode(imageNamed: DOPAMINE_NODE_TX)
        dopamineNode.position = backBrainNode.position
        dopamineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        dopamineNode.zPosition = -3
        dopamineNode.name = DOPAMINE_BRAIN_NODE_NM
        skScene.addChild(self.dopamineNode)
    }
    
    /// This method constructs the Noradrenaline node in the scene
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addNoradrenaline(skScene: SKScene) {
        noradrenalineNode = SKSpriteNode(imageNamed: NORADRENALINE_NODE_TX)
        noradrenalineNode.position = backBrainNode.position
        noradrenalineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        noradrenalineNode.zPosition = -2
        noradrenalineNode.name = NORADRENALINE_BRAIN_NODE_NM
        skScene.addChild(self.noradrenalineNode)
    }
}
