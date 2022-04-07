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
    var strokeSize: CGFloat { get set }
    
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode {
    public let node = SKSpriteNode(imageNamed: ARROW_BUTTON_NODE_TX)
    
    public func addButton(skScene: SKScene) {
        node.name = BUTTON_NODE_NM
        node.setScale(1.25)
        node.position = CGPoint(x: myScene.frame.maxX - (node.frame.width / 2) - 30, y: myScene.frame.minY + (node.frame.width / 2) + 30)
        skScene.addChild(node)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: myScene.frame.height / 4, height: myScene.frame.height / 4))
    public var color: SKColor = EXERCISE_COLOR
    public var strokeSize: CGFloat = myScene.frame.width / 10

    public func addButton(skScene: SKScene) {
        node.name = EXERCISE_BUTTON_NODE_NM
        node.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY)
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: myScene.frame.height / 4, height: myScene.frame.height / 4))
    public var color: SKColor = SLEEP_COLOR
    public var strokeSize: CGFloat = 75
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.15)
        node.name = SLEEP_BUTTON_NODE_NM
        node.alpha = 0
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}
