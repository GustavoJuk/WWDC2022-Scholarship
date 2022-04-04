import SpriteKit

public class ThirdMiniGameScene: SKScene {
    
    private let brain = Brain()
    private let nextButtonScene = NextSceneButton()
    
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = BACKGROUND_COLOR
        addAllBrainNodes()
        nextButtonScene.addButton(skScene: self)
    }
    
    public override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        
        for clickNode in nodes(at: location) {
            if clickNode.name == nextButtonScene.node.name {
                nextButtonScene.node.setScale(0.75)
                nextButtonScene.node.alpha = 0.5
                brain.backBrainNode.run(moveToNoradrenalineSide)
                brain.frontBrainNode.run(moveToNoradrenalineSide)
                brain.serotoninNode.run(moveToNoradrenalineSide)
                brain.dopamineNode.run(moveToNoradrenalineSide)
                brain.noradrenalineNode.run(moveToNoradrenalineSide)
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickedNode in nodes(at: location) {
            if clickedNode.name == nextButtonScene.node.name {
                nextButtonScene.node.setScale(1.0)
                nextButtonScene.node.alpha = 1.0
            }
        }
    }
    
    private func addAllBrainNodes() {
        brain.addBrain(skScene: self)
        brain.addSeratotin(skScene: self)
        brain.addDopamine(skScene: self)
        brain.addNoradrenaline(skScene: self)
        
        brain.backBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width * 2.0, height: brain.backBrainNode.frame.height * 2.0))
        brain.frontBrainNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.serotoninNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.dopamineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        brain.noradrenalineNode.scale(to: CGSize(width: brain.backBrainNode.frame.width, height: brain.backBrainNode.frame.height))
        
        brain.serotoninNode.alpha = 1.0
        brain.dopamineNode.alpha = 1.0
        brain.noradrenalineNode.alpha = 0.25
        
        brain.backBrainNode.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY)
        brain.frontBrainNode.position = brain.backBrainNode.position
        brain.serotoninNode.position = brain.backBrainNode.position
        brain.dopamineNode.position = brain.backBrainNode.position
        brain.noradrenalineNode.position = brain.backBrainNode.position
    }
}
