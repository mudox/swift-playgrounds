import Foundation

let text = "12,345"

let fmt = NumberFormatter()
fmt.numberStyle = .decimal
fmt.number(from: text)
