import SwiftUI
import SpriteKit

struct GameSceneView: View {
    var scene: SKScene {
        let scene = FirstScene(size: MYVIEW.frame.size)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .frame(width: MYVIEW.frame.width, height: MYVIEW.frame.height)
    }
}

//struct GameSceneView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSceneView()
//    }
//}
