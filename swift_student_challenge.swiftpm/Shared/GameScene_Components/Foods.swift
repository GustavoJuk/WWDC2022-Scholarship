//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

/// Protocol containing the attribute and method necessary for the construction of a food node in the scene
public protocol FoodNodes: SKNode {
    var node: SKSpriteNode { get set }
    
    func addFood(skScene: SKScene)
}

/// This class constructs the Bacon node in the scene
public class Bacon: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: BACON_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

/// This class constructs the Chocolate node in the scene
public class Chocolate: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: CHOCOLATE_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = HEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

/// This class constructs the Donut node in the scene
public class Donut: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: DONUT_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

/// This class constructs the Eggs node in the scene
public class Eggs: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: EGGS_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = HEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

/// This class constructs the Fries node in the scene
public class Fries: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: FRIES_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

/// This class constructs the Soda node in the scene
public class Soda: SKNode, FoodNodes {
    
    //Attributes
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: SODA_NODE_TX)
    
    //Methods
    /// This method constructs the node of a food in witch the player has to interect with
    /// - Parameter skScene: Current scene in witch the node will initialize
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}
