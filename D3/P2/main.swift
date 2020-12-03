import Foundation

func PrepareMap (_ arrayLines: [String], _ incrementX: Int, _ incrementY: Int) -> [[Character]]
{
  var map = Array(repeating: Array(repeating: Character("a"), count: 0), count: arrayLines.count)

  for index in 0...arrayLines.count-1
  {
    let lineBase = arrayLines[index]
    var fixedLine = arrayLines[index]

    while fixedLine.count < arrayLines.count * incrementX + incrementY
    {
      fixedLine += lineBase
    }

    map[index] = Array(fixedLine)
  }

  return map  
}

func CalculateTrees (_ arrayOfEntries: [String], _ incrementX: Int, _ incrementY: Int) -> Int
{
  var startingX = incrementX
  var startingY = incrementY

  var nmbOfTrees = 0

  let map = PrepareMap(arrayOfEntries, incrementX, incrementY)

  while startingY < map.count
  {
    if map[startingY][startingX] == "#"
    {
      nmbOfTrees += 1
    }

    startingY += incrementY
    startingX += incrementX
  }

  return nmbOfTrees
}

func CalculateSolution (_ map: [String]) -> Int
{
  let firstRoute = CalculateTrees(map, 1, 1)
  let secondRoute = CalculateTrees(map, 3, 1)
  let thirdRoute = CalculateTrees(map, 5, 1)
  let fourthRoute = CalculateTrees(map, 7, 1)
  let fifthRoute = CalculateTrees(map, 1, 2)

  return firstRoute * secondRoute * thirdRoute * fourthRoute * fifthRoute
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var inputLines = fileContent.split(separator: "\n").map { String($0) }

print(CalculateSolution(inputLines))