//
//  Model.swift
//  GetYes
//
//  Created by Igor Makeev on 29.06.2021.
//

struct Model: Decodable {
    let answer: String?
    let forced: Bool?
    let image: String?
    
    init(imageData: [String: Any]) {
        answer = imageData["answer"] as? String
        forced = imageData["forced"] as? Bool
        image = imageData["image"] as? String
    }
    
    static func getImages(from value: Any) -> [Model]? {
        guard let imageData = value as? [[String: Any]] else {
            return nil
        }
        return imageData.compactMap {
            Model(imageData: $0)
        }
    }
}
