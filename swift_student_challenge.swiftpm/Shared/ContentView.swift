import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = SecondScene(size: myScene.frame.size)
        gameScene.scaleMode = .fill
        return gameScene
    }
    var body: some View {
        SpriteView(scene: gameScene)
            .ignoresSafeArea()
    }
}
