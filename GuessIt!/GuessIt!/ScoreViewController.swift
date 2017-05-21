//
//  ScoreViewController.swift
//  GuessIt!
//
//  Created by Soul & Co on 19/5/17.
//  Copyright © 2017 DanielaLetunica. All rights reserved.
//


import UIKit

class ScoreViewController: UIViewController {
        
        var gravity : UIGravityBehavior?
        var animator : UIDynamicAnimator?
        var gameTimer : Timer?
        
        
        func addBalloons(_: Any){
            let xCoordinate = arc4random() % UInt32(self.view.bounds.width)
            
            let btn = UIButton(frame: CGRect(x: Int(xCoordinate), y: 60, width: 50, height: 50))
            btn.setImage(UIImage(named: "balloon-4"), for: .normal)
            btn.addTarget(self, action: #selector(self.didPopBalloon(sender:)), for: .touchUpInside)
            self.view.addSubview(btn)
            
            
            gravity?.addItem( (btn as UIView))
        }
        
        
        func didPopBalloon(sender :UIButton){
            sender.setImage(UIImage(named : "298925"), for: .normal)
            UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: { (true) in sender.removeFromSuperview()})
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ScoreViewController.addBalloons(_ :)), userInfo: nil, repeats: true)
            
            animator = UIDynamicAnimator(referenceView: self.view)
            gravity = UIGravityBehavior(items: [])
            
            
            let vector = CGVector(dx: 0.0, dy: 0.1)
            gravity?.gravityDirection = vector
            animator?.addBehavior(gravity!)
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }

    

 
