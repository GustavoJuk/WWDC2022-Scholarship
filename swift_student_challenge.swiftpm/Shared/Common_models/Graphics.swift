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
    var progressBar: SKSpriteNode { get set }
    
    func addGraphic(skScene: SKScene)
}

/// This class constructs the graphic representing the level a neurothansimitter
public class SerotoninGraphic: SKNode, Graph {
    
    //Attributes
    public var title = SEROTONIN_TITLE_TEXT
    public var progressBar = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: myScene.frame.width * 0.08, height: myScene.frame.height * 0.375))
    
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.minX + (progressBar.frame.height * 0.65), y: myScene.frame.midY * 0.315)
        
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height * 0.5))
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        delay(duration: 0.75, closure: {
            self.progressBar.run(scaleSerotoninDown)
        })
        
        skScene.addChild(progressBar)
        skScene.addChild(title)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class DopamineGraphic: SerotoninGraphic {
        
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public override func addGraphic(skScene: SKScene) {
        title = DOPAMINE_TITLE_TEXT
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 0.315)
        
        progressBar = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.height * 0.375))
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height * 0.5))
        delay(duration: 0.75, closure: {
            self.progressBar.run(scaleDopamineDown)
        })
        
        skScene.addChild(title)
        skScene.addChild(progressBar)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class NoradrenalineGraphic: SerotoninGraphic {
    
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public override func addGraphic(skScene: SKScene) {
        title = NORADRENALINE_TITLE_TEXT        
        title.position = CGPoint(x: myScene.frame.maxX - (progressBar.frame.height * 0.65), y: myScene.frame.midY * 0.315)
        
        progressBar = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width * 0.08, height: UIScreen.main.bounds.height * 0.375))
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height * 0.5))
        delay(duration: 0.75, closure: {
            self.progressBar.run(scaleNoradrenalineDown)
        })
        
        skScene.addChild(title)
        skScene.addChild(progressBar)
    }
}

/// This class constructs the progress bar of the third mini game
public class SleepProgressBar: SKNode, Graph {

    //Attributes
    public var title = SLEEP_TITLE_TEXT
    public var progressBar = SKSpriteNode()
    public var safeArea = SKSpriteNode()
    public var barBackground = SKSpriteNode()

    //Methods
    /// This method constructs every element of the progress bar, including the background and the safe area
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        barBackground = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: myScene.frame.width * 0.95, height: myScene.frame.height * 0.1))
        barBackground.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.2)
        barBackground.alpha = 0
        barBackground.zPosition = -1

        progressBar = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: myScene.frame.width * 0.02877, height: barBackground.frame.height * 0.75))
        progressBar.size.height = barBackground.frame.size.height * 0.75
        progressBar.position = CGPoint(x: barBackground.frame.minX + (progressBar.frame.height * 0.2), y: barBackground.frame.midY)
        progressBar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        progressBar.color = SLEEP_COLOR
        progressBar.alpha = 0

        safeArea = SKSpriteNode(color: .green, size: CGSize(width: myScene.frame.width * 0.1, height: progressBar.size.height))
        safeArea.position = CGPoint(x: barBackground.frame.maxX - (safeArea.frame.width * 2), y: barBackground.frame.midY)
        safeArea.alpha = 0

        skScene.addChild(progressBar)
        skScene.addChild(safeArea)
        skScene.addChild(barBackground)
    }
}
