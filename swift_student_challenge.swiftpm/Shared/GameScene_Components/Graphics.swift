//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

public protocol Graph: SKNode {
    var title: SKLabelNode { get set }
    var graphic: SKSpriteNode { get set }
    
    func addGraphic(skScene: SKScene)
}

public class SerotoninGraphic: SKNode, Graph {
    
    //Attributes
    public var title = SEROTONIN_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: MYVIEW.frame.width / 12, height: MYVIEW.frame.height / 2.5))
        
    //Methods
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: MYVIEW.frame.minX + (graphic.frame.height / 1.5), y: MYVIEW.frame.midY / 3)
        
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(0.5, closure: {
            self.graphic.run(scaleSerotoninDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

public class DopamineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = DOPAMINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
        
    //Methods
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(0.5, closure: {
            self.graphic.run(scaleDopamineDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

public class NoradrenalineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = NORADRENALINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
    
    //Methods
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: MYVIEW.frame.maxX - (graphic.frame.height / 1.5), y: MYVIEW.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(0.5, closure: {
            self.graphic.run(scaleNoradrenalineDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

public class SleepGraphic: SKNode, Graph {
    
    //Attributes
    public var title = SLEEP_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: MYVIEW.frame.width / 50, height: MYVIEW.frame.height / 10 - 25))
    public var safeArea = SKSpriteNode(color: .green, size: CGSize(width: MYVIEW.frame.width / 6, height: MYVIEW.frame.height / 10 - 25))
    public var graphBackground = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: MYVIEW.frame.width - 100, height: MYVIEW.frame.height / 10))
    public var cropNode = SKCropNode()
    
    //Methods
    public func addGraphic(skScene: SKScene) {
        graphBackground.position = CGPoint(x: MYVIEW.frame.midX, y: MYVIEW.frame.maxY - (graphic.frame.height / 2) - 50)
        graphBackground.alpha = 0
        graphBackground.zPosition = -2
        graphic.position = CGPoint(x: graphBackground.frame.minX + (graphic.frame.width / 2) + 5, y: graphBackground.frame.midY)
        graphic.alpha = 0
        graphic.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        graphic.size = CGSize(width: graphBackground.frame.width - (graphBackground.frame.width * 0.97), height: graphBackground.frame.height - (graphBackground.frame.height * 0.3))
        safeArea.position = CGPoint(x: graphBackground.frame.maxX - safeArea.frame.height * 3, y: graphBackground.frame.midY)
        safeArea.size.height = graphic.size.height
        safeArea.alpha = 0
        cropNode.maskNode = graphic
        cropNode.addChild(graphic)
        skScene.addChild(cropNode)
        skScene.addChild(safeArea)
        skScene.addChild(graphBackground)
    }
}