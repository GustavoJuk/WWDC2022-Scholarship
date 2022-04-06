//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public protocol FoodNodes: SKNode {
    var node: SKSpriteNode { get set }
    
    func addFood(skScene: SKScene)
}

public class Bacon: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: BACON_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

public class Chocolate: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: CHOCOLATE_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = HEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

public class Donut: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: DONUT_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

public class Eggs: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: EGGS_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = HEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

public class Fries: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: FRIES_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}

public class Soda: SKNode, FoodNodes {
    public var node: SKSpriteNode = SKSpriteNode(imageNamed: SODA_NODE_TX)
    
    public func addFood(skScene: SKScene) {
        node.name = UNHEALTHY_FOOD_NODE_NM
        node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        skScene.addChild(node)
    }
}
