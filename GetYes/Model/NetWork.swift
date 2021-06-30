//
//  NetWork.swift
//  GetYes
//
//  Created by Igor Makeev on 30.06.2021.
//

import UIKit
import FLAnimatedImage

class NetWork {
    
    @IBOutlet var imageView: FLAnimatedImageView!
    @IBOutlet var answerLabel: UILabel!
    
    func getImage() {
        
        guard let url = URL(string: "https://yesno.wtf/api") else { return }
        
        URLSession.shared.dataTask(with: url) { ( data, _, _ ) in
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(Model.self, from: data)
                DispatchQueue.global().async {
                    guard let url = URL(string: results.image) else { return }
                    guard let imageData = try? Data(contentsOf: url) else { return }
                    
                    DispatchQueue.main.async {
                        self.imageView.animatedImage = FLAnimatedImage(animatedGIFData: imageData)
                        self.answerLabel.text = results.answer
                        self.answerLabel.isHidden = false
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
