import Foundation

struct Option: OptionSet, Codable {
  let rawValue: Int
  
  init(rawValue: Int) {
    self.rawValue = rawValue
  }

  static let a = Option(rawValue: 1 << 0)
  static let b = Option(rawValue: 1 << 1)

  private enum CodingKeys: String, CodingKey {
    case raw
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(rawValue, forKey: .raw)
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    rawValue = try container.decode(Int.self, forKey: .raw)
  }
}

let a = Option.a

dump(a)

do {
  try JSONEncoder().encode(a)
} catch {
  print(error)
}
