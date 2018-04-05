//
//  ViewController.swift
//  AlienAnimation
//
//  Created by D7702_09 on 2018. 4. 5..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    var chk = true
    var count = 1
    var isAnimating = false
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl.text = String(count)
    }

    @IBAction func start(_ sender: Any) {
        if isAnimating == false {
        myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            isAnimating = true
        }
        else{
            myTimer.invalidate()
            isAnimating = false
        }
    }

    //Timer에 의해 동적으로 호출되는 함수
    @objc func doAnimation()    {
        if count == 5   {
            chk = false //내리막
            count = count - 1
        }else if count == 1{
            chk = true //오르막
            count = count + 1
        }else if chk == false {
            count = count - 1
        }else if chk == true {
            count = count + 1
        }
        img.image = UIImage(named : "frame\(count).png")
        lbl.text = String(count)
    }


}

