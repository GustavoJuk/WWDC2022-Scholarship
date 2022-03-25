import SpriteKit

public class SecondScene: SKScene {
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.cyan
        
        let frontBrainSide = SKSpriteNode(imageNamed: "fullBrain.png")
        
        frontBrainSide.position = CGPoint(x: frame.midX, y: frame.midY)
        frontBrainSide.zPosition = 4
        
        addChild(frontBrainSide)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let newScene = IntroScene(size: CGSize(width: 700, height: 500))
        
        self.view?.presentScene(newScene, transition: SKTransition.fade(withDuration: 1.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
