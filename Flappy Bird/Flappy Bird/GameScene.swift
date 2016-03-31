//
//  GameScene.swift
//  Flappy Bird
//
//  Created by jim Veneskey on 3/16/16.
//  Copyright (c) 2016 Jim Veneskey. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    // create a flappy bird node
    var bird = SKSpriteNode()
    
    // a sprite node for the background
    var bg = SKSpriteNode()

    
    override func didMoveToView(view: SKView) {

        // Add the background
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        // use SKAction to scroll the background
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        // need to setup a treadmill for the background image
        let replacebg = SKAction.moveByX(bgTexture.size().width, y:0, duration:  0)
        // combine these two actions (move and replace) as one action
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        
        // duplicate the background 3x
        for var i: CGFloat = 0; i < 3; i++ {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x:bgTexture.size().width/2 + (bgTexture.size().width * i), y:CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height;

            // add the current background to the scene
            bg.runAction(movebgForever)
            self.addChild(bg)
        }
        

        
        // assign the image to the node
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.2)

        // repeat the above animation
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        
        // give it a location
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        // add the animation to the bird sprite
        bird.runAction(makeBirdFlap)
        
        // add the bird to the scene / screen
        self.addChild(bird)
        
        


        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
