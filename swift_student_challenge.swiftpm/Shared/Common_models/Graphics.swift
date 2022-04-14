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
    public var progressBar = SKSpriteNode(color: SEROTONIN_COLOR, size: CGSize(width: myScene.frame.width / 12, height: myScene.frame.height / 2.5))
        
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.minX + (progressBar.frame.height / 1.5), y: myScene.frame.midY / 3)
        
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(duration: 0.75, closure: {
            self.progressBar.run(scaleSerotoninDown)
        })
        
        skScene.addChild(title)
        skScene.addChild(progressBar)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class DopamineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = DOPAMINE_TITLE_TEXT
    public var progressBar = SKSpriteNode(color: DOPAMINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
        
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY / 3)
        
        progressBar.accessibilityPath = UIBezierPath(roundedRect: progressBar.frame, cornerRadius: myScene.frame.height * 0.02)
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
        delay(duration: 0.75, closure: {
            self.progressBar.run(scaleDopamineDown)
        })
        
        skScene.addChild(title)
        skScene.addChild(progressBar)
    }
}

/// This class constructs the graphic representing the level a neurothansimitter
public class NoradrenalineGraphic: SKNode, Graph {
    
    //Attributes
    public var title = NORADRENALINE_TITLE_TEXT
    public var progressBar = SKSpriteNode(color: NORADRENALINE_COLOR, size: CGSize(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 2.5))
    
    //Methods
    /// This method constructs the graphic
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        title.position = CGPoint(x: myScene.frame.maxX - (progressBar.frame.height / 1.5), y: myScene.frame.midY / 3)
        
        progressBar.accessibilityPath = UIBezierPath(roundedRect: progressBar.frame, cornerRadius: myScene.frame.height * 0.02)
        progressBar.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        progressBar.position = CGPoint(x: title.frame.midX, y: title.frame.maxY + (title.frame.height / 2))
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
    public var progressBar = SKSpriteNode(color: SLEEP_COLOR, size: CGSize(width: myScene.frame.width * 0.05, height: myScene.frame.height * 0.25))
    public var safeArea: SKShapeNode!
    public var barBackground = SKShapeNode(rectOf: CGSize(width: myScene.frame.width * 0.95, height: myScene.frame.height * 0.1), cornerRadius: myScene.frame.height * 0.02)
    public var cropNode = SKCropNode()

    //Methods
    /// This method constructs every element of the progress bar, including the background and the safe area
    /// - Parameter skScene: Current scene in witch the nodes will initialize
    public func addGraphic(skScene: SKScene) {
        barBackground.position = CGPoint(x: myScene.frame.midX, y: myScene.frame.midY * 1.2)
        barBackground.strokeColor = .clear
        barBackground.alpha = 0
        barBackground.fillColor = SLEEP_COLOR
        barBackground.zPosition = -1

        progressBar.size.height = barBackground.frame.size.height * 0.75
        progressBar.position = CGPoint(x: barBackground.frame.minX + (progressBar.frame.height * 0.2), y: barBackground.frame.midY)
        progressBar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        progressBar.color = SLEEP_COLOR
        progressBar.alpha = 0

        safeArea = SKShapeNode(rectOf: CGSize(width: myScene.frame.width * 0.1, height: progressBar.size.height), cornerRadius: myScene.frame.height * 0.02)
        safeArea.position = CGPoint(x: barBackground.frame.maxX - (safeArea.frame.width * 2), y: barBackground.frame.midY)
        safeArea.fillColor = .green
        safeArea.strokeColor = .clear
        safeArea.alpha = 0

        cropNode.maskNode = progressBar
        cropNode.addChild(progressBar)

        skScene.addChild(cropNode)
        skScene.addChild(safeArea)
        skScene.addChild(barBackground)
    }
}
