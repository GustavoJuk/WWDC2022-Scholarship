import SpriteKit

//TODO: Documentation
public protocol ButtonNode: SKNode {
    var node: SKShapeNode { get set }
    var color: NSColor { get set }
    var strokeSize: CGFloat { get set }
    
    func createButton()
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(rect: CGRect(x: skView.frame.midX + (skView.frame.midX / 1.25), y: skView.frame.midY - (skView.frame.midY / 1.1), width: 50, height: 55))
    public var color: NSColor = .clear
    public var strokeSize: CGFloat = 0
    public let buttonNode = SKSpriteNode(imageNamed: buttonSpriteName)
    
    public func createButton() {
        buttonNode.name = buttonNodeName
        buttonNode.position = CGPoint(x: node.frame.midX, y: node.frame.midY)
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.buttonNode)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = exercisesColor
    public var strokeSize: CGFloat = 30
    
    public func createButton() {
        
        node.name = exerciseButtonNodeName
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.node)
    }
}

public class DietButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = dietColor
    public var strokeSize: CGFloat = 30
    
    public func createButton() {
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.name = dietButtonNodeName
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.node)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var node: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = sleepColor
    public var strokeSize: CGFloat = 30
    
    public func createButton() {
        node.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        node.name = sleepButtonNodeName
        node.fillColor = color
        node.strokeColor = color.withAlphaComponent(0.5)
        node.lineWidth = strokeSize
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.node)
    }
}
