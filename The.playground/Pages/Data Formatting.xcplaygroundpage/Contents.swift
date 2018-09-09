//: [Previous](@previous)
import Foundation

let formatter = DateIntervalFormatter()
formatter.dateStyle = .long
formatter.timeStyle = .medium
formatter.locale = Locale(identifier: "cn")

let start = Date()
let end = Date(timeInterval: 3932, since: start)

formatter.string(from: start, to: end)

var bytes: Int64 = 23892893
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .file)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .memory)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .decimal)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .binary)


bytes = 2893
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .file)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .memory)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .decimal)
ByteCountFormatter.string(fromByteCount: bytes, countStyle: .binary)
