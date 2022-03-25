import SpriteKit

public class GameScene: SKScene {
    
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

        seratoninView.position = CGPoint(x: frame.midX - 75, y: frame.midY - 14)
        seratoninView.zPosition = 1
        
        
        addChild(seratoninView)
        
    }
    
    func addDopamineView() {
        let dopamineView = SKSpriteNode(imageNamed: "dopamine.png")

        dopamineView.position = CGPoint(x: frame.midX + 65, y: frame.midY - 60)
        dopamineView.zPosition = 2
        
        addChild(dopamineView)
        
    }
    
    func addNoradrenalineView() {
        let noradrenalineView = SKSpriteNode(imageNamed: "noradrenaline.png")

        noradrenalineView.position = CGPoint(x: frame.midX + 22, y: frame.midY + 70)
        noradrenalineView.zPosition = 3
        
        addChild(noradrenalineView)
        
    }
    
    func addBraiinFrontView() {
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
        addBraiinFrontView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
