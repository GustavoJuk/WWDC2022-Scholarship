import SpriteKit

public class SecondScene: SKScene {
    
    private var article = SKLabelNode(fontNamed: "\(MAIN_FONT) - Regular")
    private let nextSceneButton = NextSceneButton()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = BACKGROUND_COLOR
        addText()
        nextSceneButton.addButton(skScene: self)
    }
    
    public override func mouseDown(with event: NSEvent) {

        let location = event.location(in: self)

        for clickNode in nodes(at: location) {
            if clickNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(0.75)
                nextSceneButton.node.alpha = 0.5
                transition(nextScene: ThirdScene(size: SKVIEW.frame.size), currentScene: self)
            }
        }
    }
    
    public override func mouseUp(with event: NSEvent) {
        
        let location = event.location(in: self)
        
        for clickedNode in nodes(at: location) {
            if clickedNode.name == nextSceneButton.node.name {
                nextSceneButton.node.setScale(1.0)
                nextSceneButton.node.alpha = 1.0
            }
        }
    }
    
    private func addText() {
        article.text = "Much is discussed about depression and how terrible is... but, do you know what happens exactly?\n\nDepression is classified as a disease because of its symptoms, which affect not only the psychological area, but also the body, since chemical processes take place when a person feels this way.\n\nMost people have a stigma about this issue because it is not a visible thing. Also the same people who judge the victims do not know what is going on inside their minds and bodies."
        article.position = CGPoint(x: SKVIEW.frame.midX, y: SKVIEW.frame.midY / 2)
        article.fontSize = MAIN_BODY_SIZE_FONT
        article.preferredMaxLayoutWidth = SKVIEW.frame.size.width - 30
        article.numberOfLines = 10
        addChild(article)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
