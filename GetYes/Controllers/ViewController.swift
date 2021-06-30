//
//  ViewController.swift
//  GetYes
//
//  Created by Igor Makeev on 29.06.2021.
//

import UIKit
import FLAnimatedImage
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var imageView: FLAnimatedImageView!
    @IBOutlet var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        answerLabel.isHidden = true
    }
    
    func getImage() {
        
        guard let url = URL(string: "https://yesno.wtf/api") else { return }
        
        AF.request(url).validate().responseDecodable(of: Model.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.global().async {
                    guard let url = URL(string: data.image!) else { return }
                    guard let imageData = try? Data(contentsOf: url) else { return }
                    DispatchQueue.main.async {
                        self.imageView.animatedImage = FLAnimatedImage(animatedGIFData: imageData)
                        self.answerLabel.text = data.answer
                        self.answerLabel.isHidden = false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        getImage()
    }
}

