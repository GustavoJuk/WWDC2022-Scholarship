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
    
    public func addButton(skScene: SKScene) {
        node.name = BUTTON_NODE_NM
        node.position = CGPoint(x: SKVIEW.frame.midX + (SKVIEW.frame.midX / 1.25), y: SKVIEW.frame.midY - (SKVIEW.frame.midY / 1.25))
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

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 75)
    public var color: NSColor = SLEEP_COLOR
    public var strokeSize: CGFloat = 75
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        node.name = SLEEP_BUTTON_NODE_NM
        node.alpha = 0
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}
