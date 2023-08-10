

import Foundation

class PersonDetails : Codable{
    let id : Int?
    let city : String?
    let last_name : String?
    let first_name : String?
    
    enum CodingKeys : String, CodingKey{
        case id = "id"
        case city = "city"
        case last_name = "last_name"
        case first_name = "first_name"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.last_name = try container.decodeIfPresent(String.self, forKey: .last_name)
        self.first_name = try container.decodeIfPresent(String.self, forKey: .first_name)
    }
}
