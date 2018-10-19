import Foundation

let f = """
<https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=2>; rel="next", <https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=34>; rel="last"
"""

let m = """
<https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=1>; rel="prev", <https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=3>; rel="next", <https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=34>; rel="last", <https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=1>; rel="first"
"""

let l = """
<https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=33>; rel="prev", <https://api.github.com/search/repositories?q=neovim&sort=stars&order=desc&page=1>; rel="first"
"""

enum Pagination {

  static let firstRegex = try! NSRegularExpression(pattern: "<([^>]+)>; rel=\"first\"")
  static let lastRegex = try! NSRegularExpression(pattern: "<([^>]+)>; rel=\"last\"")
  static let prevRegex = try! NSRegularExpression(pattern: "<([^>]+)>; rel=\"prev\"")
  static let nextRegex = try! NSRegularExpression(pattern: "<([^>]+)>; rel=\"next\"")

  static func url(from text: String, using pattern: NSRegularExpression) -> URL? {
    do {
      guard
        let match = pattern.firstMatch(in: text, range: NSMakeRange(0, text.count))
      else {
        return nil
      }

      let range = match.range(at: 1)
      guard range.location != NSNotFound else {
        return nil
      }

      let urlString = (text as NSString).substring(with: range)
      return URL(string: urlString)
    } catch {
      dump(error)
      return nil
    }

  }

  static func pageIndex(from url: URL) -> Int? {
    guard
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
      let queryItems = components.queryItems,
      let pageItem = queryItems.first(where: { $0.name == "page" })
    else { return nil }

    return Int(pageItem.value ?? "")
  }

  case first(next: URL, last: URL)
  case other(first: URL, last: URL, previous: URL, next: URL)
  case last(previous: URL, first: URL)

  init?(from headers: [String: String]) {
    guard let text = headers["Link"] else { return nil }

    let first = Pagination.url(from: text, using: Pagination.firstRegex)
    let last = Pagination.url(from: text, using: Pagination.lastRegex)
    let next = Pagination.url(from: text, using: Pagination.nextRegex)
    let prev = Pagination.url(from: text, using: Pagination.prevRegex)

    switch (first, last, prev, next) {

    case let (nil, last?, nil, next?):
      self = Pagination.first(next: next, last: last)

    case let (first?, last?, prev?, next?):
      self = Pagination.other(first: first, last: last, previous: prev, next: next)

    case let (first?, nil, prev?, nil):
      self = Pagination.last(previous: prev, first: first)

    default:
      print("unexpected combination")
      return nil
    }
  }

  var pageIndex: Int? {
    switch self {
    case .first:
      return 0
    case let .other(_, _, _, nextURL):
      let nextIndex = Pagination.pageIndex(from: nextURL)
      return nextIndex?.advanced(by: -1)
    case let .last(prevURL, _):
      let prevIndex = Pagination.pageIndex(from: prevURL)
      return prevIndex?.advanced(by: 1)
    }
  }

  var totalCount: Int? {
    switch self {
    case let .first(_, lastURL):
      return Pagination.pageIndex(from: lastURL)
    case let .other(_, lastURL, _, _):
      return Pagination.pageIndex(from: lastURL)
    case let .last:
      return pageIndex
    }
  }
}

Pagination(from: ["Link": f])?.pageIndex
Pagination(from: ["Link": l])?.pageIndex
Pagination(from: ["Link": m])?.pageIndex
