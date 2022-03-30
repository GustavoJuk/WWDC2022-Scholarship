import SpriteKit

public protocol ButtonNode: SKNode {
    var circle: SKShapeNode { get set }
    var color: NSColor { get set }
    var strokeSize: CGFloat { get set }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var circle: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = exercisesColor
    public var strokeSize: CGFloat = 30
    
    private func createButton() {
        
        circle.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        circle.name = "Exercice Button"
        circle.fillColor = color
        circle.strokeColor = color.withAlphaComponent(0.5)
        circle.lineWidth = strokeSize
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        circle.physicsBody?.isDynamic = false
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.circle)
    }
}

public class DietButton: SKNode, ButtonNode {
    public var circle: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = dietColor
    public var strokeSize: CGFloat = 30
    
    private func createButton() {
        circle.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        circle.name = "Diet Button"
        circle.fillColor = color
        circle.strokeColor = color.withAlphaComponent(0.5)
        circle.lineWidth = strokeSize
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        circle.physicsBody?.isDynamic = false
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.circle)
    }
}

public class SleepButton: SKNode, ButtonNode {
    public var circle: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = sleepColor
    public var strokeSize: CGFloat = 30
    
    private func createButton() {
        circle.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY)
        circle.name = "Sleep Button"
        circle.fillColor = color
        circle.strokeColor = color.withAlphaComponent(0.5)
        circle.lineWidth = strokeSize
        circle.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        circle.physicsBody?.isDynamic = false
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.circle)
    }
}
