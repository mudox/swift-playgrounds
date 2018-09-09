import Foundation

let username = "cempri@163.com"
let password = "heiheihahax_"

let text = "\(username):\(password)"
let encodedText = text.data(using: .utf8)!.base64EncodedString()
print("Authorization: Basic \(encodedText)")
