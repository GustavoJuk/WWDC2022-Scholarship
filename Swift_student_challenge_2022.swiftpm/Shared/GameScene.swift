import SpriteKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {}

class GameScene: SKScene {
    let gameScene = FirstScene(size:MYVIEW.frame.size)

    override func sceneDidLoad() {
        super.sceneDidLoad()
        MYVIEW.presentScene(gameScene)
    }
}
