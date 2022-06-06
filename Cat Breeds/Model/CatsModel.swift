import Foundation

struct CatsModel: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let wikipedia_url: String?
    let image: CatImage?
    let origin: String
   
   
}

struct CatImage: Codable {
    let id: String?
    let url: String?
}

