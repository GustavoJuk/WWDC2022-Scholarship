import SwiftUI
import SpriteKit

struct ContentView: View {
    var gameScene: SKScene {
        let gameScene = FirstScene(size: MYVIEW.frame.size)
        gameScene.scaleMode = .fill
        return gameScene
    }
    var body: some View {
        SpriteView(scene: gameScene)
            .frame(width: MYVIEW.frame.width, height: MYVIEW.frame.height)
    }
}
