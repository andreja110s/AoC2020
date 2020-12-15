import Foundation

func FindNumberInIteration(_ inputNumbers: [Int]) -> Int
{
  var dictionaryOfNumbers = Dictionary(uniqueKeysWithValues: inputNumbers.map { (Int($0), (inputNumbers.firstIndex(of: $0)! + 1)) })

  var previousNumber = 0

  for index in (inputNumbers.count + 1)..<(30000000)
  {
    if dictionaryOfNumbers[previousNumber] == nil
    {
      dictionaryOfNumbers[previousNumber] = index

      previousNumber = 0
    }
    else
    {
      var nextNumber = index - dictionaryOfNumbers[previousNumber]!

      dictionaryOfNumbers[previousNumber] = index

      previousNumber = nextNumber
    }
  }
  return previousNumber
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let inputNumbers = fileContent.components(separatedBy: ",").map { Int($0)! }

print(FindNumberInIteration(inputNumbers))