//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public class Brain: SKNode {
    
    //Attributes
    public var backBrainNode = SKSpriteNode()
    public var serotoninNode = SKSpriteNode()
    public var dopamineNode = SKSpriteNode()
    public var noradrenalineNode = SKSpriteNode()
    public var frontBrainNode = SKSpriteNode()
                
    //Methods
    public func addBrain(skScene: SKScene) {
        backBrainNode = SKSpriteNode(imageNamed: BACK_BRAIN_NODE_TX)
        backBrainNode.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY * 1.25)
        backBrainNode.scale(to: CGSize(width: backBrainNode.frame.width / 1.5, height: backBrainNode.frame.height / 1.5))
        backBrainNode.zPosition = -5
        backBrainNode.name = BACK_BRAIN_NODE_TX
        frontBrainNode = SKSpriteNode(imageNamed: FRONT_BRAIN_NODE_TX)
        frontBrainNode.position = backBrainNode.position
        frontBrainNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        frontBrainNode.zPosition = -1
        frontBrainNode.name = FRONT_BRAIN_NODE_TX
        skScene.addChild(self.backBrainNode)
        skScene.addChild(self.frontBrainNode)
    }
    
    public func addSeratotin(skScene: SKScene) {
        serotoninNode = SKSpriteNode(imageNamed: SEROTONIN_NODE_TX)
        serotoninNode.position = backBrainNode.position
        serotoninNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        serotoninNode.zPosition = -4
        serotoninNode.name = SEROTONIN_NODE_TX
        skScene.addChild(self.serotoninNode)
    }
    
    public func addDopamine(skScene: SKScene) {
        dopamineNode = SKSpriteNode(imageNamed: DOPAMINE_NODE_TX)
        dopamineNode.position = backBrainNode.position
        dopamineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        dopamineNode.zPosition = -3
        dopamineNode.name = DOPAMINE_NODE_TX
        skScene.addChild(self.dopamineNode)
    }
    
    public func addNoradrenaline(skScene: SKScene) {
        noradrenalineNode = SKSpriteNode(imageNamed: NORADRENALINE_NODE_TX)
        noradrenalineNode.position = backBrainNode.position
        noradrenalineNode.scale(to: CGSize(width: backBrainNode.frame.width, height: backBrainNode.frame.height))
        noradrenalineNode.zPosition = -2
        noradrenalineNode.name = NORADRENALINE_NODE_TX
        skScene.addChild(self.noradrenalineNode)
    }
}
