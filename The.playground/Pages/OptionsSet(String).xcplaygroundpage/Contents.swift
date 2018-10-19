import Foundation

public struct Scope: OptionSet {

  // MARK: - SetAlgebra

  public mutating func formUnion(_ other: Scope) {
    rawValue.formUnion(other.rawValue)
  }

  public mutating func formIntersection(_ other: Scope) {
    rawValue.formIntersection(other.rawValue)
  }

  public mutating func formSymmetricDifference(_ other: Scope) {
    rawValue.formSymmetricDifference(other.rawValue)
  }

  public init() {
    rawValue = []
  }

  // MARK: - RawRepresentable

  public var rawValue: Set<String>

  public init(rawValue: Set<String>) {
    self.rawValue = rawValue
  }

  static let a = Scope(rawValue: ["a"])
  static let b = Scope(rawValue: ["b"])
  static let c = Scope(rawValue: ["c"])
  static let d = Scope(rawValue: ["d"])
}


let scopes: Scope = [.a, .c]
scopes.rawValue

let encoder = JSONEncoder()
let data = try encoder.encode(scopes.rawValue)
let text = String(data: data, encoding: .utf8)
