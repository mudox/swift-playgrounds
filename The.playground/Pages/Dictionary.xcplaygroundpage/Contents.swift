import Foundation

play("uniquingKeysWith...") {
  let pairsWithDuplicateKeys = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
  print(pairsWithDuplicateKeys)
  let firstValues = Dictionary(pairsWithDuplicateKeys, uniquingKeysWith: { (first, _) in first })
  print(firstValues)
  let lastValues = Dictionary(pairsWithDuplicateKeys, uniquingKeysWith: { (_, last) in last })
  print(lastValues)
}
