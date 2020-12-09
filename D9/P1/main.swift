import Foundation

func SumIntoNumber(_ window: [Int], _ sum: Int) -> Bool
{
  return window.enumerated().contains(
    where: 
    { (x, y) -> Bool in
      window[x+1..<window.count].contains(sum-y)
    }
  )
}

func FindNumber(_ arrayOfNumbers: [Int]) -> Int
{
  var windowStartIndex: Int
  var windowEndIndex: Int
  var windowLookIndex: Int
  var window: [Int]

  for index in 26...arrayOfNumbers.count-1
  {
    windowStartIndex = index - 26
    windowEndIndex = index - 1
    windowLookIndex = index

    window = Array(arrayOfNumbers[windowStartIndex..<windowEndIndex + 1])

    if !SumIntoNumber(window, arrayOfNumbers[windowLookIndex])
    {
      return arrayOfNumbers[windowLookIndex]
    }
  }

  return -1
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfNumbers = fileContent.split(separator: "\n").map { Int($0)! }

print(FindNumber(arrayOfNumbers))