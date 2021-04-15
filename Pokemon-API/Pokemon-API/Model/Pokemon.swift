import UIKit

struct Pokemon {
    let name: String
    let image: UIImage
    let baseExperience: Double
    let height: Double
    let weight: Double
    
    enum CodingKeys: String, CodingKey {
        case name, image, baseExperience = "base_experience", height, weight
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let
//    }
}
