import SpriteKit

//TODO: Documentation
public protocol ButtonNode: SKNode {
    var node: SKShapeNode { get set }
    var color: NSColor { get set }
    var strokeSize: CGFloat { get set }
    
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode {
    public let node = SKSpriteNode(imageNamed: buttonSpriteName)
    
    public func createButton() {
        node.name = buttonNodeName
        node.position = CGPoint(x: skView.frame.midX + (skView.frame.midX / 1.25), y: skView.frame.midY - (skView.frame.midY / 1.25))
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(node)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = exercisesColor
    public var strokeSize: CGFloat = 30

    public func addButton(skScene: SKScene) {
        node.name = exerciseButtonNodeName
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}

public class DietButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = dietColor
    public var strokeSize: CGFloat = 30
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.name = dietButtonNodeName
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = sleepColor
    public var strokeSize: CGFloat = 30
    
    public func addButton(skScene: SKScene) {
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.name = sleepButtonNodeName
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
        skScene.addChild(node)
    }
}
