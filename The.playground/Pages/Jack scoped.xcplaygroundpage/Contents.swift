import Foundation

class Jack {
  private static let defaultLevel = 1
  private static var scopeLevels: [String: Int] = [:]

  var scope: String
  var level: Int {
    let scopes = sequence(first: self.scope.components(separatedBy: ".")[...]) {
      guard !$0.isEmpty else { return nil }
      return $0.dropLast()
    }.map { String($0.joined(separator: ".")) }

    for s in scopes {
      if let level = Jack.scopeLevels[s] {
        return level
      }
    }

    return Jack.defaultLevel
  }

  init(scope: String, level: Int? = nil) {
    precondition(!scope.isEmpty)

    self.scope = scope
    if let level = level {
      Jack.scopeLevels[scope] = level
    }
  }

}

let s1 = Jack(scope: "a.b.c", level: 3)
s1.level
let s2 = Jack(scope: "a.b", level: 2)
s2.level
let s3 = Jack(scope: "x")
s3.level
let s4 = Jack(scope: "a.b.x")
s4.level

enum GitHub {
  case zen
  case userProfile(String)
}


