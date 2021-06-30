//
//  ViewController.swift
//  GetYes
//
//  Created by Igor Makeev on 29.06.2021.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {
    
    var data = NetWork()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        data.answerLabel.isHidden = true
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {

        data.getImage()
    }
}
