//
//  ViewController.swift
//  Remote_Stove
//
//  Created by leo on 2018/2/20.
//  Copyright © 2018 leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    var deg: CGFloat = 0
    var last_position = CGPoint()
    var rotation : CGFloat = 0
    var center = CGPoint()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        self.last_position = touch.location(in: touch.view)
    }
    func rotate(){
        img.transform = CGAffineTransform(rotationAngle: self.rotation)
    }
    func get_rad(point: CGPoint) ->CGFloat  {
        if point.x == 0{
            if point.x > self.img.center.x{
                return 0
            }
            else{
                return CGFloat(Float.pi)
            }
        }
        let dif_x = point.x - self.center.x
        let dif_y = point.y - self.center.y
        if point.x > self.img.center.x{
            return atan(dif_y/dif_x)
        }
        return atan(dif_y/dif_x) + CGFloat(Float.pi)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: touch.view)
        
        let rad1 = get_rad(point: self.last_position)
        let rad2 = get_rad(point: location)
        self.rotation += (rad2 - rad1)
        self.last_position = location
        print("hhhrotate\(self.rotation)")
        rotate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.deg)
        print(atan(1.0))
        let degree = self.deg / CGFloat(Double.pi) / 2 * 360
        print(degree)
        
    }
    
    @IBOutlet weak var sss: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.center = img.center
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

