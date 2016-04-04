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
        
        // Add gravity
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.texture!.size().height/2)
        bird.physicsBody!.dynamic = true;
        
        // give it a location
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        // add the animation to the bird sprite
        bird.runAction(makeBirdFlap)
        
        // add the bird to the scene / screen
        self.addChild(bird)
        
        // add invisible ground to the game - keep the bird from falling for infinity
        let ground = SKNode()
        ground.position = CGPointMake(0, 0)
        // make our physics body 1 pixel high by the width of the screen
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        // make the ground defy gravity - otherwise, it also would fall away :-P
        ground.physicsBody!.dynamic = false
        
        self.addChild(ground)


        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // on each touch - we bump the bird up a little
        // set velocity to zero..
        bird.physicsBody!.velocity = CGVectorMake(0, 0)
        bird.physicsBody!.applyImpulse(CGVectorMake(0, 50))
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
