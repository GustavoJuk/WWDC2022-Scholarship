import SpriteKit

public class IntroScene: SKScene {
    
    private var brainParts = Brain()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = .cyan
        brainParts.addBrain(skScene: self)
        brainParts.addSeratotin(skScene: self)
        brainParts.addDopamine(skScene: self)
        brainParts.addNoradrenaline(skScene: self)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let newScene = SecondScene(size: skView.frame.size)
        
        self.view?.presentScene(newScene)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
