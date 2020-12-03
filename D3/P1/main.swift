import Foundation

func CalculateTrees (_ arrayOfEntries: [[Character]]) -> Int
{
  var startingX = 3
  var startingY = 1

  var nmbOfTrees = 0

  while startingY < arrayOfEntries.count
  {
    if arrayOfEntries[startingY][startingX] == "#"
    {
      nmbOfTrees += 1
    }

    startingY += 1
    startingX += 3
  }

  return nmbOfTrees
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var inputLines = fileContent.split(separator: "\n")
var inputTo2dArray = Array(repeating: Array(repeating: Character("a"), count: 0), count: inputLines.count)

for index in 0...inputLines.count-1
{
  let lineBase = inputLines[index]
  var fixedLine = inputLines[index]

  while fixedLine.count < inputLines.count * 3 + 1
  {
    fixedLine += lineBase
  }

  inputTo2dArray[index] = Array(fixedLine)
}

print(CalculateTrees(inputTo2dArray))