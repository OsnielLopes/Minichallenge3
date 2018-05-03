//
//  RingSCN.swift
//  MiniChallenge3
//
//  Created by Osniel Lopes Teixeira on 02/05/2018.
//  Copyright © 2018 Guilherme Paciulli. All rights reserved.
//

import WatchKit
import SpriteKit

class RingContainerSCN: WKInterfaceSKScene {

}

class RingSCN: SKScene {
    
    var ring: RingSKNode!
    var label: SKLabelNode!
    
    public var isRotating = false {
        didSet {
            if isRotating == false {
                self.addedCigarretes = 0
            }
        }
    }
    var addedCigarretes = 0
    
    override func sceneDidLoad() {
        self.backgroundColor = .black
        
        self.ring = RingSKNode(diameter: self.size.width)
        self.ring.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(ring)
        
        self.label = SKLabelNode(text: "0")
        self.label.position = CGPoint(x: self.frame.midX, y: self.frame.maxY)
        self.addChild(label)
    }
    
    func didRotateCrown(with delta: Double) {
        isRotating = true
        let aCigarret = 0.15
        
        if delta > Double(addedCigarretes+1)*aCigarret {
            addedCigarretes += 1
            ring.arcEnd += CGFloat(aCigarret)
        }
        else if delta < Double(addedCigarretes-1)*aCigarret && delta < 0{
            addedCigarretes -= 1
            ring.arcEnd -= CGFloat(aCigarret)
        }
        
//        print("Cigarros adicionados: \(addedCigarretes) - Delta: \(delta)")
    }
}
