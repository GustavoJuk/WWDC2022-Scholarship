import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = ThirdMiniGameScene(size: MYVIEW.frame.size)
        gameScene.scaleMode = .fill
        return gameScene
    }
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene)
                .frame(width: MYVIEW.frame.width, height: MYVIEW.frame.height)
        }
        .ignoresSafeArea()
    }
}
