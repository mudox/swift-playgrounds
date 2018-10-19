import Foundation

do {

  let url = Bundle.main.url(forResource: "1", withExtension: "txt")!
  let data = FileManager.default.contents(atPath: url.path)!
  let text = String(data: data, encoding: .utf8)!

  /*
   *
   * Step 1 - Parse HTTP message
   *
   */

  // let nl = "\\r\\n"
  let nl = "(?:\\n|\\r\\n|\\r)"

  let pattern = """
  HTTP/1.1 \\s+ (\\d+) \\s+ \\w+  # Status Line
  \(nl)
  (.*)                            # Header
  \(nl)\(nl)
  (.*)                            # Body
  """

  let regex = try NSRegularExpression(
    pattern: pattern,
    options: [
      .allowCommentsAndWhitespace,
      .dotMatchesLineSeparators,
    ]
  )

  let match = regex.firstMatch(in: text, options: [], range: NSMakeRange(0, text.count))!

  // Status code
  let statusCodeText = (text as NSString).substring(with: match.range(at: 1))
  let statusCode = Int(statusCodeText)!

  // Header
  let header = (text as NSString).substring(with: match.range(at: 2))
  let headerList: [(String, String)] = header
    .split(separator: "\n")
    .map {
      let split = $0.split(separator: ":", maxSplits: 1, omittingEmptySubsequences: false)
        .map(String.init)
      return (split[0], split[1])
    }
  let headerDict = [String: String](uniqueKeysWithValues: headerList)
  dump(headerDict)

  let body = (text as NSString).substring(with: match.range(at: 3))

} catch {
  dump(error)
}
