import Foundation

play("DataIntervalFormatter") {
  let fmt = DateIntervalFormatter()
  fmt.dateStyle = .short
  fmt.timeStyle = .none

  let from = Date()
  let to = Date(timeIntervalSinceNow: 864_383)
  fmt.string(from: from, to: to)
}

play("DataIntervalFormatter") {
  let fmt = DateComponentsFormatter()
  fmt.allowsFractionalUnits = true
  fmt.includesApproximationPhrase = true
  fmt.includesTimeRemainingPhrase = true
  fmt.allowedUnits = [.minute, .second]

  fmt.string(from: 839_829)
}

play("NumberFormatter - Concurrency") {
  let fmt = NumberFormatter()
  fmt.numberStyle = .currency
  fmt.currencyGroupingSeparator = ","
  fmt.maximumFractionDigits = 0
  fmt.string(from: 2398.23)

  let a = "11"
  a.split(separator: ".")
  a.components(separatedBy: ".")
}

play("Parse date string") {
  let fmt = DateFormatter()
  fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
  
  let dateString = "2018-09-06T15:52:33Z"
  fmt.date(from: dateString)
}
