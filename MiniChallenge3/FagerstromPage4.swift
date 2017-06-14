//
//  FagerstromPage4.swift
//  MiniChallenge3
//
//  Created by Erick Borges on 11/06/17.
//  Copyright © 2017 Guilherme Paciulli. All rights reserved.
//

import UIKit

class FagerstromPage4: PageModelViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var one: UIButton!
    
    var originalColor = UIColor.green
    
    func cleanAll() {
        zero.tintColor = originalColor
        one.tintColor = originalColor
    }
    
    //MARK: - Atributes
    var points: Int?
    
    override func shouldContinueToNextViewController() -> Bool {
        return points != nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        originalColor = zero.tintColor
    }
    
    //MARK: - Actions
    @IBAction func yesTap(_ sender: Any) {
        points = 1
        cleanAll()
        zero.tintColor = UIColor.yellow    }
    
    @IBAction func noTap(_ sender: Any) {
        points = 0
        cleanAll()
        one.tintColor = UIColor.yellow
    }
}
