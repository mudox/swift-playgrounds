//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

let pg = PlaygroundPage.current
pg.needsIndefiniteExecution = true

var task: URLSessionTask!
task = URLSession.shared.dataTask(with: URL(string: "http://www.163.com")!) {
  data, response, error in

  data
  response
  error

  task.state

  pg.finishExecution()
}

task.state
task.resume()
task.state

task.suspend()
task.state

task.cancel()
task.state
