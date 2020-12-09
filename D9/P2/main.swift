import Foundation

func SumTo(_ numbers: [Int]) -> Int
{
  return numbers.reduce(0, +)
}

func SumMinAndMax(_ numbers: [Int]) -> Int
{
  let min: Int = numbers.min()!
  let max: Int = numbers.max()!

  return min + max
}

func FindNumbers(_ arrayOfNumbers: [Int]) -> Int
{
  var windowStartIndex: Int
  var windowEndIndex: Int
  var window: [Int] = []
  var windowSum = -1

  for index in 0..<arrayOfNumbers.count - 2
  {
    windowStartIndex = index
    windowEndIndex = index + 1

    while windowEndIndex < arrayOfNumbers.count
    {
      window = Array(arrayOfNumbers[windowStartIndex..<windowEndIndex + 1])
      windowSum = SumTo(window)

      if !(windowSum < 144381670)
      {
        break
      }

      windowEndIndex += 1

    }
    
    if windowSum == 144381670
    {
      return SumMinAndMax(window)
    }

  }

  return -1
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfNumbers = fileContent.split(separator: "\n").map { Int($0)! }

print(FindNumbers(arrayOfNumbers))