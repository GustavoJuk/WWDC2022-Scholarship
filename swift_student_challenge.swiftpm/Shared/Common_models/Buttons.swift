//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

/// Protocol containing the attributes and method necessary for a button in the scene
public protocol ButtonNode: SKNode {
    var node: SKShapeNode { get set }
    
    func addButton(skScene: SKScene)
}

/// This class constructs the node where the player transits scenes
public class NextSceneButton: SKNode {
    
    //Attributes
    public let node = SKSpriteNode(imageNamed: ARROW_BUTTON_NODE_TX)
    
    //Methods
    /// This method constructs the node of the Button in witch the player has to interect to change a scene
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addButton(skScene: SKScene) {
        node.name = BUTTON_NODE_NM
        node.setScale(1.25)
        node.position = CGPoint(x: myScene.frame.maxX - (node.frame.width * 1.2), y: myScene.frame.minY + (node.frame.width * 1.2))
        skScene.addChild(node)
    }
}

/// This class constructs the node where the player interects to play the first mini game
public class ExerciseButton: SKNode, ButtonNode {
    
    //Attributes
    public var node: SKShapeNode = SKShapeNode(ellipseOf: CGSize(width: myScene.frame.height * 0.175, height: myScene.frame.height * 0.175))

    //Methods
    /// This method constructs the node in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addButton(skScene: SKScene) {
        node.name = EXERCISE_BUTTON_NODE_NM
        node.position = CGPoint(x: myScene.frame.minX + (myScene.frame.midX * 0.3), y: myScene.frame.minY + (myScene.frame.midY * 0.3))
        node.fillColor = EXERCISE_COLOR
        node.strokeColor = EXERCISE_COLOR.withAlphaComponent(0.5)
        node.lineWidth = node.frame.width * 0.5
        skScene.addChild(node)
    }
}

/// This class constructs the node where the player interects to play the third mini game
public class SleepButton: ExerciseButton {
    
    //Methods
    /// This methos constructs the node in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public override func addButton(skScene: SKScene) {
        node.position = CGPoint(x: myScene.frame.maxX - (myScene.frame.midX * 0.3), y: myScene.frame.minY + (myScene.frame.midY * 0.3))
        node.name = SLEEP_BUTTON_NODE_NM
        node.alpha = 0
        node.fillColor = SLEEP_COLOR
        node.strokeColor = SLEEP_COLOR.withAlphaComponent(0.5)
        node.lineWidth = node.frame.width * 0.5
        skScene.addChild(node)
    }
}
