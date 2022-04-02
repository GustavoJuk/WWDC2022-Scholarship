import SpriteKit

//TODO: Documentation
public protocol ButtonNode: SKNode {
    var node: SKShapeNode { get set }
    var color: NSColor { get set }
    var strokeSize: CGFloat { get set }
    
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode {
    public let node = SKSpriteNode(imageNamed: ARROW_BUTTON_NODE_TX)
    
    public func createButton() {
        node.name = BUTTON_NODE_NM
        node.position = CGPoint(x: SKVIEW.frame.midX + (SKVIEW.frame.midX / 1.25), y: SKVIEW.frame.midY - (SKVIEW.frame.midY / 1.25))
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(node)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = EXERCISE_COLOR
    public var strokeSize: CGFloat = 30

    public func addButton(skScene: SKScene) {
        node.name = EXERCISE_BUTTON_NODE_NM
        node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}

public class DietButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 200, height: 100))
    public var color: NSColor = DIET_COLOR
    public var strokeSize: CGFloat = 0
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        node.name = DIET_BUTTON_NODE_NM
        node.fillColor = color
        node.fillTexture = SKTexture(imageNamed: EGGS_NODE_TX)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = SLEEP_COLOR
    public var strokeSize: CGFloat = 30
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        node.name = SLEEP_BUTTON_NODE_NM
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}
