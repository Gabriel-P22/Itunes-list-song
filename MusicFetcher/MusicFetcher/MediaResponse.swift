import Foundation

struct MediaResponse: Codable {
  var results: [MusicItem]
}

struct MusicItem: Codable, Identifiable  {
  let id: Int
  let artistName: String
  let trackName: String
  let collectionName: String
  let previewUrl: String
  let artwork: String
  
  enum CodingKeys: String, CodingKey {
    case id = "trackId"
    case artistName
    case trackName
    case collectionName
    case previewUrl
    case artwork = "artworkUrl100"
  }
}

