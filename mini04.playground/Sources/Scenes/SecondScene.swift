import SpriteKit

public class SecondScene: SKScene {
    private var brain = Brain()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = .cyan
        brain.addBrain(skScene: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
