import Foundation

func FindStartTime(_ listOfBuses: [String]) -> Int
{
  var dictionaryOfIndexes = [String : Int]()

  for index in 0..<listOfBuses.count
  {
    dictionaryOfIndexes[listOfBuses[index]] = index
  }

  var firstNmb = Int(listOfBuses[0])!
  var firstNmbBase = Int(listOfBuses[0])!
  var secondNmbBase = 0
  var secondNmb = 0
  var multiplier = Int(listOfBuses[0])!

  for index in 1..<(listOfBuses.count)
  {
    if listOfBuses[index] == "x"
    {
      continue
    }
    secondNmb = Int(listOfBuses[index])!
    secondNmbBase = Int(listOfBuses[index])!
    while true
    {
      if firstNmb + (dictionaryOfIndexes[String(secondNmbBase)]! - dictionaryOfIndexes[String(firstNmbBase)]!) == secondNmb
      {
        firstNmb = secondNmb
        multiplier = multiplier * secondNmbBase
        firstNmbBase = secondNmbBase
        break
      }
      else
      {
        if firstNmb <= secondNmb
        {
          firstNmb = firstNmb + multiplier
        }
        else // if firstNmb > secondNmb
        {
          secondNmb = ((firstNmb / secondNmbBase) + 1 ) * secondNmbBase
        }
      }
    }
  }

  return secondNmb - listOfBuses.count + 1
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var listOfInputs = fileContent.split(separator: "\n").map { String($0) }

let earliestDepartTimestamp = Int(listOfInputs[0])!
let busIDs = listOfInputs[1].split(separator: ",").map { String($0) }

print(FindStartTime(busIDs))