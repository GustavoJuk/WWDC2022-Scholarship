//
//  File.swift
//  swift_student_challenge
//
//  Created by Gustavo Juk Ferreira Cruz on 06/04/22.
//

import SpriteKit

/// Protocol containing the attributes and method necessary for a graphic in the scene
public protocol Graph: SKNode {
    var title: SKLabelNode { get set }
    var graphic: SKSpriteNode { get set }
    
    func addGraphic(skScene: SKScene)
}

/// This class constructs the graphic representing the level a neurothansimitter
public class SerotoninGraphic: SKNode, Graph {
    
    //Attributes
    public var title = SEROTONIN_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: myScene.frame.width / 12, height: myScene.frame.height / 2.5))
        
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.minX + (graphic.frame.height / 1.5), y: myScene.frame.midY / 3)
        
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(duration: 0.75, closure: {
            self.graphic.run(scaleSerotoninDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class DopamineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = DOPAMINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
        
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(duration: 0.75, closure: {
            self.graphic.run(scaleDopamineDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class NoradrenalineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = NORADRENALINE_TITLE_TEXT
    public var graphic = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
    
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.maxX - (graphic.frame.height / 1.5), y: myScene.frame.midY / 3)
        graphic.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        graphic.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(duration: 0.75, closure: {
            self.graphic.run(scaleNoradrenalineDown)
        })
        skScene.addChild(title)
        skScene.addChild(graphic)
    }
}

/// This class constructs the progress bar of the third mini game
public class SleepGraphic: SKNode, Graph {
    
    //Attributes
    public var title = SLEEP_TITLE_TEXT
    public var graphic = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: myScene.frame.width * 0.25, height: myScene.frame.height * 0.25))
    public var safeArea = SKSpriteNode(color: .green, size: CGSize(width: myScene.frame.width * 0.1, height: myScene.frame.height * 0.25))
    public var graphBackground = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: myScene.frame.width * 0.95, height: myScene.frame.height * 0.1))
    public var cropNode = SKCropNode()
    
    //Methods
    /// This method constructs every element of the progress bar, including the background and the safe area
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        graphBackground.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.25)
        graphBackground.alpha = 0
        graphBackground.zPosition = -2
        graphic.position = CGPoint(x: graphBackground.frame.minX + (graphic.frame.height * 0.08), y: graphBackground.frame.midY)
        graphic.alpha = 0
        graphic.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        graphic.size = CGSize(width: graphBackground.frame.width - (graphBackground.frame.width * 0.97), height: graphBackground.frame.height - (graphBackground.frame.height * 0.3))
        safeArea.position = CGPoint(x: graphBackground.frame.maxX - safeArea.frame.height, y: graphBackground.frame.midY)
        safeArea.size.height = graphic.size.height
        safeArea.alpha = 0
        cropNode.maskNode = graphic
        cropNode.addChild(graphic)
        skScene.addChild(cropNode)
        skScene.addChild(safeArea)
        skScene.addChild(graphBackground)
    }
}
