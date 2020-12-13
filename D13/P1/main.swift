import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var listOfInputs = fileContent.split(separator: "\n").map { String($0) }

let earliestDepartTimestamp = Int(listOfInputs[0])!
let busIDs = listOfInputs[1]
  .replacingOccurrences(of: ",x", with: "")
  .split(separator: ",").map { Int($0)! }

let dictBusIdBusArrival = Dictionary(uniqueKeysWithValues: busIDs.map { ($0, (((earliestDepartTimestamp / $0) + 1) * $0 - earliestDepartTimestamp)) })

let solutionPair = dictBusIdBusArrival.min { a, b in a.value < b.value }!

print(solutionPair.key * solutionPair.value)