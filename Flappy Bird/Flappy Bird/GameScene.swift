//
//  GameScene.swift
//  Flappy Bird
//
//  Created by jim Veneskey on 3/16/16.
//  Copyright (c) 2016 Jim Veneskey. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    // Track our game score
    var score = 0
    var scoreLabel = SKLabelNode()
    
    // show a countdown in the score label before starting...
    var countDown = 50
    
    // create a flappy bird node
    var bird = SKSpriteNode()
    
    // a sprite node for the background
    var bg = SKSpriteNode()

    // add the pipes
    var pipe1 = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    
    // a collector for the pipes etc
    var movingObjects = SKSpriteNode()
    
    // our game over container
    var labelContainer = SKSpriteNode()
    
    // categories
    enum ColliderType: UInt32 {
        case Bird = 1
        case Object = 2
        case Gap = 4
    }
    
    // game state
    // possible states: intro, running, over
    var gameState = "intro"
    // and a label for the message
    var gameOverLabel = SKLabelNode()
    
    
    // a reusable function for creating the background
    func makeBackground() {
        // Add the background
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        // use SKAction to scroll the background
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        // need to setup a treadmill for the background image
        let replacebg = SKAction.moveByX(bgTexture.size().width, y:0, duration:  0)
        // combine these two actions (move and replace) as one action
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        
        // duplicate the background 3x
        for i in 0 ..< 3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x:bgTexture.size().width/2 + (bgTexture.size().width * CGFloat(i) ), y:CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height;
            
            // experimental flickering fix
            bg.zPosition = -5
            
            // add the current background to the scene
            bg.runAction(movebgForever)
            movingObjects.addChild(bg)
        }

    }
    
    override func didMoveToView(view: SKView) {
        
        // enable contact between physics objects
        self.physicsWorld.contactDelegate = self

        self.addChild(movingObjects)
        self.addChild(labelContainer)
        
        // add the background
        makeBackground()

        // Add the scoring label
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - 70)
        // explicitly assign z
        scoreLabel.zPosition = -3
        self.addChild(scoreLabel)
        
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
        
        // stop the bird from rotating
        bird.physicsBody!.allowsRotation = false;
        
        // set our collision category
        bird.physicsBody!.categoryBitMask = ColliderType.Bird.rawValue
        // game is over if the bird contacts anything
        bird.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        // the following is unused, since as soon as contact is made, game is over.
        bird.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        
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

        // set our collision category
        ground.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        // game is over if the bird contacts anything - note the mask is the same as for the bird
        ground.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        // the following is unused, since as soon as contact is made, game is over.
        ground.physicsBody!.collisionBitMask = ColliderType.Object.rawValue

        self.addChild(ground)

        
        // add a timer to spawn new pipes
        _ = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector: #selector(GameScene.makePipes), userInfo: nil, repeats: true)
        

    }
    
    func makePipes() {
        // The height of the gap between our pipes
        // set it initially 4x the height of the bird
        let gapHeight = bird.size.height * 4
        
        // add some randomness to the pipe positions
        let movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        // print("pipeOffset = \(pipeOffset)")
        
        // spawn and remove pipes as they scroll to the left
        let movePipes = SKAction.moveByX(-self.frame.size.width * 2, y:0, duration: NSTimeInterval(self.frame.size.width / 100))
        let removePipes = SKAction.removeFromParent()
        let moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
        
        
        // Add the pipes
        // pipe1 (upper)
        let pipe1Texture = SKTexture(imageNamed: "pipe1.png")
        let pipe1 = SKSpriteNode(texture: pipe1Texture)
        // adjust X so it spawns off the right edge - and scrolls onto the screen
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipe1Texture.size().height/2 + (gapHeight / 2) + pipeOffset)
        pipe1.zPosition = -4
        pipe1.runAction(moveAndRemovePipes)
        
        // add physics
        pipe1.physicsBody = SKPhysicsBody(rectangleOfSize: pipe1Texture.size())
        // set our collision category
        pipe1.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        // game is over if the bird contacts anything - note the mask is the same as for the bird
        pipe1.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        // the following is unused, since as soon as contact is made, game is over.
        pipe1.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        // make the pipe defy gravity - otherwise, it also would fall away :-P
        pipe1.physicsBody!.dynamic = false

        movingObjects.addChild(pipe1)
        
        // pipe2 (lower)
        let pipe2Texture = SKTexture(imageNamed: "pipe2.png")
        let pipe2 = SKSpriteNode(texture: pipe2Texture)
        // adjust X so it spawns off the right edge - and scrolls onto the screen
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2Texture.size().height/2 - (240 / 2) + pipeOffset)
        pipe2.zPosition = -4
        pipe2.runAction(moveAndRemovePipes)

        // add physics
        pipe2.physicsBody = SKPhysicsBody(rectangleOfSize: pipe2Texture.size())
        // set our collision category
        pipe2.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        // game is over if the bird contacts anything - note the mask is the same as for the bird
        pipe2.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        // the following is unused, since as soon as contact is made, game is over.
        pipe2.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        // make the pipe defy gravity - otherwise, it also would fall away :-P
        pipe2.physicsBody!.dynamic = false

        movingObjects.addChild(pipe2)
        
        // Add the scoring window
        let gap = SKNode()
        // for placing the scoring window - uncomment the lines involving 'scoringBlock'
        // let scoringBlock = SKSpriteNode(color: SKColor.blackColor(), size: CGSizeMake(pipe1.size.width, gapHeight))
        // scoringBlock.runAction(moveAndRemovePipes)
        
        gap.position = CGPoint(x:CGRectGetMidX(self.frame) + self.frame.size.width + 100 + bird.size.width, y: CGRectGetMidY(self.frame) + pipeOffset)

        gap.runAction(moveAndRemovePipes)
        // give the scoring window a physics body, and make sure it defies gravity!
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipe1.size.width, gapHeight))
        gap.physicsBody!.dynamic = false
        // enable colliding with it from the bird
        gap.physicsBody!.categoryBitMask = ColliderType.Gap.rawValue
        // we'll use the collision as a score incrementor
        gap.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        // the following is unused, since we don't want it stopping the bird
        gap.physicsBody!.collisionBitMask = ColliderType.Gap.rawValue
        // add it
        movingObjects.addChild(gap)
        
        // scoringBlock.position = CGPoint(x:CGRectGetMidX(self.frame) + self.frame.size.width + 100 + bird.size.width, y: CGRectGetMidY(self.frame) + pipeOffset)
        //scoringBlock.zPosition = 9 // zPosition to change in which layer the barra appears.
        
        // scoringBlock.zPosition = -3
        // movingObjects.addChild(scoringBlock)

    }
    
    // handle contacts here
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == ColliderType.Gap.rawValue || contact.bodyB.categoryBitMask == ColliderType.Gap.rawValue {
            score += 1
            // print("You have scored a point, score is now: \(score)")
            scoreLabel.text = "\(score)"
            
        } else {
            // contact made with something other than the gap - bad!
            
            // only display the label, if the game is not already over
            if gameState == "running" {
                // stop the game
                gameState = "over"
                self.speed = 0
                gameOverLabel.text = "GAME OVER - YOU LOST!"
                gameOverLabel.fontName = "Helvetica"
                gameOverLabel.fontSize = 30
                gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                gameOverLabel.zPosition = -1
                labelContainer.addChild(gameOverLabel)
                // freeze the bird where it is
                bird.physicsBody!.velocity = CGVectorMake(0, 0)
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // only allow user input if the game is not over
        
        if gameState == "running" {
            // on each touch - we bump the bird up a little
            // set velocity to zero..
            bird.physicsBody!.velocity = CGVectorMake(0, 0)
            bird.physicsBody!.applyImpulse(CGVectorMake(0, 50))
        } else if gameState == "over" {
            // this means the game is over, and someone touched the screen
            // so we start the game again
            score = 0
            scoreLabel.text = "0"
            // reset the bird to the middle of the screen
            bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            
            // purge our moving objects group
            movingObjects.removeAllChildren()
            
            // reset the background
            makeBackground()
            
            // reset the game speed to normal
            self.speed = 1
            
            // reset our game state back to the intro
            countDown = 50
            gameState = "intro"
            
            // remove the game over label
           labelContainer.removeAllChildren()
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //print("The current game state is: \(gameState)")
        var introMessage = ""
        
        if gameState == "intro" {
            // make the bird impervious to gravity
            bird.physicsBody!.dynamic = false
            // choose the message to show depending on the count
            if countDown > 35 {
                introMessage = "Get Ready!"
            } else if countDown > 20 {
                introMessage = "Get Set!"
            } else if countDown > 5 {
                introMessage = "Go!"
            }

            // decrement our countdown timer down to 0...
            countDown -= 1
            // times up?
            if countDown == -1 {
                gameState = "running"
                bird.physicsBody!.dynamic = true
                introMessage = "0"
            }

            scoreLabel.text = introMessage

        }
    }
}
