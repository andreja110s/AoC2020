import Foundation

func GetResult(_ arrayOfNumbers: [Int]) -> Int
{
  var oneJolts = 0
  var threeJolts = 0

  for index in 0..<arrayOfNumbers.count-2
  {
    if arrayOfNumbers[index] == arrayOfNumbers[index + 1] - 1
    {
      oneJolts += 1
    }
    else
    {
      threeJolts += 1
    }
  }

  threeJolts += 1

  return oneJolts * threeJolts
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var arrayOfNumbers = fileContent.split(separator: "\n").map { Int($0)! }
arrayOfNumbers.append(0)
arrayOfNumbers.append(arrayOfNumbers.max()! + 3)
arrayOfNumbers.sort()

print(GetResult(arrayOfNumbers))