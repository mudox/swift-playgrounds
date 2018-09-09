import Foundation

let json = """
{
  "feed": {
    "title":"Top Audio Podcasts",
    "country":"gb",
    "updated":"2017-11-16T02:02:55.000-08:00",
    "results":[
    {
    "artistName":"BBC Radio",
    "name":"Blue Planet II: The Podcast",
    "releaseDate":"2017-11-12",
    "url":"https://itunes.apple.com/gb/podcast/blue-planet-ii-the-podcast/id1296222557?mt=2"
    },
    {
    "artistName":"Audible",
    "name":"The Butterfly Effect with Jon Ronson",
    "releaseDate":"2017-11-03",
    "url":"https://itunes.apple.com/gb/podcast/the-butterfly-effect-with-jon-ronson/id1258779354?mt=2"
    },
    {
    "artistName":"TED",
    "name":"TED Talks Daily",
    "releaseDate":"2017-11-16",
    "url":"https://itunes.apple.com/gb/podcast/ted-talks-daily/id160904630?mt=2"
    }
    ]
  }
}
"""

let data = Data(json.utf8)

struct RSSFeed: Codable {
  struct Feed: Codable {
    struct Podcast: Codable {
      let name: String
      let artistName: String
      let url: URL
      let releaseDate: Date
    }

    let title: String
    let country: String
    let updated: Date
    let podcasts: [Podcast]

    private enum CodingKeys: String, CodingKey {
      case title
      case country
      case updated
      case podcasts = "results"
    }
  }

  let feed: Feed
}

do {
  let decoder = JSONDecoder()
  try decoder.decode(RSSFeed.self, from: data)
} catch {
  dump(error)
}
