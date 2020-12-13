import Foundation

func GetResult(_ arrayOfNumbers: [Int]) -> Int
{
  var dictionaryOfWays = [Int : Int]()

  for index in (0..<arrayOfNumbers.count).reversed()
  {
    let arrayOfLargerNumbers = arrayOfNumbers
      .filter { $0 <= arrayOfNumbers[index] + 3 && $0 > arrayOfNumbers[index]}

    if arrayOfLargerNumbers.count == 0
    {
      dictionaryOfWays[arrayOfNumbers[index]] = 0
    }
    else
    {
      dictionaryOfWays[arrayOfNumbers[index]] = 0
      var tmp = 0
      for number in arrayOfLargerNumbers
      {

        tmp += dictionaryOfWays[number]! == 0 ? 1 : dictionaryOfWays[number]!
        
      }
      dictionaryOfWays[arrayOfNumbers[index]] = tmp
    }

  }

  return dictionaryOfWays[arrayOfNumbers.min()!]!
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var arrayOfNumbers = fileContent.split(separator: "\n").map { Int($0)! }
arrayOfNumbers.append(0)
arrayOfNumbers.append(arrayOfNumbers.max()! + 3)
arrayOfNumbers.sort()

print(GetResult(arrayOfNumbers))