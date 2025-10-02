

import Foundation



struct Photo : Decodable, Identifiable{
    var id = UUID()
    var title: String
    var explanation: String
    var url : String?
    
    enum CodingKeys : String, CodingKey{
        case title
        case explanation
        case url
    }
}
