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

    // add the pipes
    var pipe1 = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    
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
            
            // experimental flickering fix
            bg.zPosition = -5

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

        
        // add a timer to spawn new pipes
        _ = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
        

    }
    
    func makePipes() {
        // The height of the gap between our pipes
        // set it initially 4x the height of the bird
        let gapHeight = bird.size.height * 4
        print("The gapHeight is \(gapHeight)")
        
        // add some randomness to the pipe positions
        let movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        print("pipeOffset = \(pipeOffset)")
        
        // spawn and remove pipes as they scroll to the left
        let movePipes = SKAction.moveByX(-self.frame.size.width * 2, y:0, duration: NSTimeInterval(self.frame.size.width / 100))
        let removePipes = SKAction.removeFromParent()
        let moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
        
        
        // Add the pipes
        let pipe1Texture = SKTexture(imageNamed: "pipe1.png")
        var pipe1 = SKSpriteNode(texture: pipe1Texture)
        // adjust X so it spawns off the right edge - and scrolls onto the screen
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipe1Texture.size().height/2 + (gapHeight / 2) + pipeOffset)
        pipe1.zPosition = -4
        pipe1.runAction(moveAndRemovePipes)
        self.addChild(pipe1)
        
        let pipe2Texture = SKTexture(imageNamed: "pipe2.png")
        var pipe2 = SKSpriteNode(texture: pipe2Texture)
        // adjust X so it spawns off the right edge - and scrolls onto the screen
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2Texture.size().height/2 - (240 / 2) + pipeOffset)
        pipe2.zPosition = -4
        pipe2.runAction(moveAndRemovePipes)
        self.addChild(pipe2)

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
