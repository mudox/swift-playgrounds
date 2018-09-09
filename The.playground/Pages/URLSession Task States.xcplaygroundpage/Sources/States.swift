import Foundation

import Foundation

extension URLSessionTask.State: CustomStringConvertible {
  
  public var description: String {
    switch self {
    case .running: return "URLSessionTask.running"
    case .suspended: return "URLSessionTask.suspended"
    case .canceling: return "URLSessionTask.canceling"
    case .completed: return "URLSessionTask.completed"
    }
  }
  
}
