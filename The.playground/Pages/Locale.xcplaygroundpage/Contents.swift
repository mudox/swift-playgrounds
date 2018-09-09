import Foundation

let allIdentifiers = Locale.availableIdentifiers

allIdentifiers
  .filter { $0.starts(with: "zh") }
  .forEach { print($0) }
