import SpriteKit

public class IntroScene: SKScene {
    
    private var brainParts = Brain()
    private var title = SKLabelNode(fontNamed: "\(mainFontName) - Bold")
    private var footer = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = backGroundColor
        brainParts.addBrain(skScene: self)
        addTitleText()
        addFooterText()
    }
    
    private func addTitleText() {
        title.text = "That's the human brain"
        title.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY * 1.7)
        addChild(title)
    }
    
    private func addFooterText() {
        footer.text = "It is here where we process the main functions of the body and maintaining the health of this organ is extremely important."
        footer.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 2.5)
        footer.fontSize = 20
        footer.preferredMaxLayoutWidth = skView.frame.size.width - 30
        footer.numberOfLines = 2
        addChild(footer)
    }
    
    public override func mouseUp(with event: NSEvent) {
        let newScene = SecondScene(size: skView.frame.size)
        
        self.view?.presentScene(newScene, transition: .fade(with: backGroundColor, duration: 1.5))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
