import Foundation

func example(of description: String, action: (() -> Void)) {
  print("\n\n--- Example of: \(description) ---")
  action()
}
