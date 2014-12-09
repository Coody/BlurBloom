//
//  GameScene.swift
//  BlurBloom
//
//  Created by Hesham on 12/9/14.
//  Copyright (c) 2014 Hesham Amiri. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        // original sprite
        
        let Originalsprite = SKSpriteNode(imageNamed: "ship")
        let Originallocation = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)+125))
        Originalsprite.position = Originallocation
        
        self.addChild(Originalsprite)
        
        
        
        // sprite with shader
        
        let sprite = SKSpriteNode(imageNamed: "ship")
        let location = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)-125))
        sprite.position = location
        
        let fragShader = SKShader(fileNamed: "blur")
        sprite.shader = fragShader
        
        
       
        self.addChild(sprite)

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
