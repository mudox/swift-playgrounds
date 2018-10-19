import Foundation

let nl = "(?:\\n|\\r\\n|\\r)"

let pattern = """
^
--- \\s* \(nl)
(.*)
--- \\s* \(nl)
(.*)
$
"""

let regex = try! NSRegularExpression(
  pattern: pattern,
  options: [
    .allowCommentsAndWhitespace,
    .dotMatchesLineSeparators,
  ]
)

do {
  let url = Bundle.main.url(forResource: "index", withExtension: "md")!
  let text = try String(contentsOf: url)

  let range = NSRange(text.startIndex ..< text.endIndex, in: text)
  let match = regex.firstMatch(in: text, range: range)!
  let yamlString = text[Range(match.range(at: 1), in: text)!]
  let description = text[Range(match.range(at: 2), in: text)!]

} catch {
  dump(error)
}
