import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = FirstScene(size: myScene.frame.size)
        gameScene.scaleMode = .fill
        return gameScene
    }
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene)
                .frame(width: myScene.frame.width, height: myScene.frame.height)
        }
        .ignoresSafeArea()
    }
}
