import Foundation

struct Target: Decodable {
  let url: URL?
  let name: String
  let info: [String: String]?
}

do {
  let d1 = """
  {
    "name": "mudox",
    "url": "163.com"
  }
  """.data(using: .utf8)!

  let t1 = try JSONDecoder().decode(Target.self, from: d1)
  print(t1)

  let d2 = """
  {
    "name": "mudox",
  }
  """.data(using: .utf8)!

  let t2 = try JSONDecoder().decode(Target.self, from: d2)
  print(t2)
} catch {
  print(error)
}

struct ShippingOptions: OptionSet, Codable {
  let rawValue: Int

  public init(rawValue: Int) {
    self.rawValue = rawValue
  }

  // primitive cases
  static let nextDay = ShippingOptions(rawValue: 1 << 0)
  static let secondDay = ShippingOptions(rawValue: 1 << 1)
  static let priority = ShippingOptions(rawValue: 1 << 2)
  static let standard = ShippingOptions(rawValue: 1 << 3)

  // derived cases
  static let express: ShippingOptions = [.nextDay, .secondDay]
  static let all: ShippingOptions = [.express, .priority, .standard]
}

do {
  let a = ShippingOptions.express
  let data = try JSONEncoder().encode(a)
  print(String(data: data, encoding: .utf8)!)
} catch {
  print(error)
}
