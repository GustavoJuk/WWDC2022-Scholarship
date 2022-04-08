//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

//TODO: Documentation
public protocol ButtonNode: SKNode {
    var node: SKShapeNode { get set }
    var color: SKColor { get set }
    
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode {
    public let node = SKSpriteNode(imageNamed: ARROW_BUTTON_NODE_TX)
    
    public func addButton(skScene: SKScene) {
        node.name = BUTTON_NODE_NM
        node.setScale(1.25)
        node.position = CGPoint(x: myScene.frame.maxX - (node.frame.width * 1.2), y: myScene.frame.minY + (node.frame.width * 1.2))
        skScene.addChild(node)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: myScene.frame.height * 0.125, height: myScene.frame.height * 0.125))
    public var color: SKColor = EXERCISE_COLOR

    public func addButton(skScene: SKScene) {
        node.name = EXERCISE_BUTTON_NODE_NM
        node.position = CGPoint(x: myScene.frame.minX + (myScene.frame.midX * 0.3), y: myScene.frame.minY + (myScene.frame.midY * 0.3))
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = node.frame.width * 0.5
        skScene.addChild(node)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: myScene.frame.height * 0.15, height: myScene.frame.height * 0.15))
    public var color: SKColor = SLEEP_COLOR
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: myScene.frame.maxX - (myScene.frame.midX * 0.3), y: myScene.frame.minY + (myScene.frame.midY * 0.3))
        node.name = SLEEP_BUTTON_NODE_NM
        node.alpha = 0
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = node.frame.width * 0.5
        skScene.addChild(node)
    }
}
