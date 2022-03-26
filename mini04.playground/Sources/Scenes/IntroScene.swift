import SpriteKit

public class IntroScene: SKScene {
    
    private var brainParts = Brain()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        brainParts.addBrain(skScene: self)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let newScene = SecondScene(size: skView.frame.size)
        
        self.view?.presentScene(newScene, transition: .fade(with: backGroundColor, duration: 1.5))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//tiamu muitão
