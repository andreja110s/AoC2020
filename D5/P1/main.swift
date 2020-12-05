import Foundation

func CalculateRow(_ letter: Character, _ min: Int, _ max: Int) -> [Int]
{
  var minRow = min
  var maxRow = max

  if letter == "F"
  {
    maxRow = max - ((max-min)/2) - 1

    return [minRow, maxRow]
  }
  else //if letter == "B"
  {
    minRow = min + ((max-min)/2) + 1

    return [minRow, maxRow]
  }
}

func CalculateColumn(_ letter: Character, _ min: Int, _ max: Int) -> [Int]
{

  var minColumn = min
  var maxColumn = max

  if letter == "L"
  {
    maxColumn = max - ((max-min)/2) - 1

    return [minColumn, maxColumn]
  }
  else //if letter == "R"
  {
    minColumn = min + ((max-min)/2) + 1

    return [minColumn, maxColumn]
  }
}

func CalculateSeatId(_ partitioning: String) -> Int
{
  let partsOfPartitioning = Array(partitioning)

  var minRow: Int = 0
  var maxRow: Int = 127

  var minColumn: Int = 0
  var maxColumn: Int = 7

  for index in 0...partsOfPartitioning.count-4
  {
    let newRowNmbs = CalculateRow(partsOfPartitioning[index], minRow, maxRow)
    minRow = newRowNmbs[0]
    maxRow = newRowNmbs[1]
  }

  for index in partsOfPartitioning.count-3...partsOfPartitioning.count-1
  {
    let newColumnNmbs = CalculateColumn(partsOfPartitioning[index], minColumn, maxColumn)
    minColumn = newColumnNmbs[0]
    maxColumn = newColumnNmbs[1]
  }

  return minRow * 8 + minColumn
}

func CalculateHighestSeatId(_ arrayOfPartitions: [String]) -> Int
{
  let arrayOfIds = arrayOfPartitions.map { CalculateSeatId($0) }

  return arrayOfIds.max()!
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfPartitions = fileContent.split(separator: "\n").map { String($0) }

print(CalculateHighestSeatId(arrayOfPartitions))