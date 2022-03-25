import SpriteKit

public class IntroScene: SKScene {
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    func addBrainBackView() {
        let backBrainNode = SKSpriteNode(imageNamed: "backBrain.png")
        
        backBrainNode.position = CGPoint(x: frame.midX, y: frame.midY)
        backBrainNode.zPosition = 0
        
        addChild(backBrainNode)
    }
    
    func addSeratoninView() {
        let seratoninView = SKSpriteNode(imageNamed: "seratonin.png")
        
        seratoninView.position = CGPoint(x: frame.midX, y: frame.midY)
        seratoninView.zPosition = 1
        
        
        addChild(seratoninView)
        
    }
    
    func addDopamineView() {
        let dopamineView = SKSpriteNode(imageNamed: "dopamine.png")
        
        dopamineView.position = CGPoint(x: frame.midX, y: frame.midY)
        dopamineView.zPosition = 2
        
        addChild(dopamineView)
        
    }
    
    func addNoradrenalineView() {
        let noradrenalineView = SKSpriteNode(imageNamed: "noradrenaline.png")
        
        noradrenalineView.position = CGPoint(x: frame.midX, y: frame.midY)
        noradrenalineView.zPosition = 3
        
        addChild(noradrenalineView)
        
    }
    
    func addBrainFrontView() {
        let frontBrainSide = SKSpriteNode(imageNamed: "frontBrain.png")
        
        frontBrainSide.position = CGPoint(x: frame.midX, y: frame.midY)
        frontBrainSide.zPosition = 4
        
        addChild(frontBrainSide)
        
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.cyan
        
        addBrainBackView()
        addSeratoninView()
        addDopamineView()
        addNoradrenalineView()
        addBrainFrontView()
    }
    
    public override func mouseUp(with event: NSEvent) {
        let newScene = SecondScene(size: CGSize(width: 700, height: 500))
        
        self.view?.presentScene(newScene, transition: SKTransition.fade(withDuration: 1.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
