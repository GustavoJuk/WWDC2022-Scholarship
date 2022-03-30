import SpriteKit

public protocol ButtonNode: SKNode {
    var circle: SKShapeNode { get set }
    var color: NSColor { get set }
    var strokeSize: CGFloat { get set }
    
    func createButton()
    func addButton(skScene: SKScene)
}

public class NextSceneButton: SKNode, ButtonNode {
    public var circle: SKShapeNode = SKShapeNode(rect: CGRect(x: skView.frame.midX + (skView.frame.midX / 1.25), y: skView.frame.midY - (skView.frame.midY / 1.1), width: 50, height: 55))
    public var color: NSColor = .white
    public var strokeSize: CGFloat = 0
    private let image = SKTexture(imageNamed: "backBrain")
    
    public func createButton() {
        circle.name = "Next page"
        circle.fillColor = color
        circle.lineWidth = strokeSize
//        circle.fillTexture = image
    }
    
    public func addButton(skScene: SKScene) {
        createButton()
        skScene.addChild(self.circle)
    }
}

public class ExerciseButton: SKNode, ButtonNode {
    public var circle: SKShapeNode = SKShapeNode(circleOfRadius: 30)
    public var color: NSColor = exercisesColor
    public var strokeSize: CGFloat = 30
    
    public func createButton() {
        
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
    
    public func createButton() {
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
    
    public func createButton() {
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
