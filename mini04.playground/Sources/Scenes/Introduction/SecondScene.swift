import SpriteKit

public class SecondScene: SKScene {
    
    private var article = SKLabelNode(fontNamed: "\(mainFontName) - Regular")
    private let nextSceneButton = NextSceneButton()
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    public override func didMove(to view: SKView) {
        self.backgroundColor  = backGroundColor
        addText()
        nextSceneButton.addButton(skScene: self)
    }
    
    public override func mouseUp(with event: NSEvent) {
        transition(nextScene: ThirdScene(size: skView.frame.size), currentScene: self)
    }
    
    private func addText() {
        article.text = "Much is discussed about depression and how terrible is... but, do you know what happens exactly?\n\nDepression is classified as a disease because of its symptoms, which affect not only the psychological area, but also the body, since chemical processes take place when a person feels this way.\n\nMost people have a stigma about this issue because it is not a visible thing. Also the same people who judge the victims do not know what is going on inside their minds and bodies."
        article.position = CGPoint(x: skView.frame.midX, y: skView.frame.midY / 2)
        article.fontSize = 20
        article.preferredMaxLayoutWidth = skView.frame.size.width - 30
        article.numberOfLines = 10
        addChild(article)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
