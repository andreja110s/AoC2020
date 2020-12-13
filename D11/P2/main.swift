import Foundation

func GetFirstVisible(_ seatLayout: [[Character]], _ row: Int, _ column: Int, _ direction: String) -> String
{
  if direction == "N"
  {
    for rowIndex in (0..<row).reversed()
    {
      if seatLayout[rowIndex][column] != "."
      {
        return String(seatLayout[rowIndex][column])
      }
    }
  }
  else if direction == "S"
  {
    for rowIndex in row + 1..<(seatLayout.count)
    {
      if seatLayout[rowIndex][column] != "."
      {
        return String(seatLayout[rowIndex][column])
      }
    }
  }
  else if direction == "E"
  {
    for columnIndex in column + 1..<(seatLayout[row].count)
    {
      if seatLayout[row][columnIndex] != "."
      {
        return String(seatLayout[row][columnIndex])
      }
    }
  }
  else if direction == "W"
  {
    for columnIndex in (0..<column).reversed()
    {
      if seatLayout[row][columnIndex] != "."
      {
        return String(seatLayout[row][columnIndex])
      }
    }
  }
  else if direction == "NE"
  {
    var rowIndex = row - 1
    var columnIndex = column + 1

    while rowIndex > -1 && columnIndex < seatLayout[rowIndex].count
    {
      if seatLayout[rowIndex][columnIndex] != "."
      {
        return String(seatLayout[rowIndex][columnIndex])
      }

      rowIndex -= 1
      columnIndex += 1
    }
  }
  else if direction == "NW"
  {
    var rowIndex = row - 1
    var columnIndex = column - 1

    while rowIndex > -1 && columnIndex > -1
    {
      if seatLayout[rowIndex][columnIndex] != "."
      {
        return String(seatLayout[rowIndex][columnIndex])
      }

      rowIndex -= 1
      columnIndex -= 1
    }
  }
  else if direction == "SE"
  {
    var rowIndex = row + 1
    var columnIndex = column + 1

    while rowIndex < seatLayout.count && columnIndex < seatLayout[rowIndex].count
    {
      if seatLayout[rowIndex][columnIndex] != "."
      {
        return String(seatLayout[rowIndex][columnIndex])
      }

      rowIndex += 1
      columnIndex += 1
    }
  }
  else if direction == "SW"
  {
    var rowIndex = row + 1
    var columnIndex = column - 1

    while rowIndex < seatLayout.count && columnIndex > -1
    {
      if seatLayout[rowIndex][columnIndex] != "."
      {
        return String(seatLayout[rowIndex][columnIndex])
      }

      rowIndex += 1
      columnIndex -= 1
    }
  }

  return "."
}

func TransformSeat(_ seatLayout: [[Character]], _ row: Int, _ column: Int) -> Character
{
  if seatLayout[row][column] == "L"
  {
    if row == 0
    {
      if column == 0
      {

        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "E")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"

      }
      else if column == seatLayout[row].count - 1
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
    }
    else if row == seatLayout.count - 1
    {
      if column == 0
      {

        let seenSeats = GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "E")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"

      }
      else if column == seatLayout[row].count - 1
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
    }
    else
    {
      if column == 0
      {

        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "E")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
      else if column == seatLayout[row].count - 1
      {

        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "W")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "N")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied == 0 ? "#" : "L"
      }
    }
  }
  else if seatLayout[row][column] == "#"
  {
    if row == 0
    {
      if column == 0 || column == seatLayout[row].count - 1
      {
        return "#"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied > 4 ? "L" : "#"
      }
    }
    else if row == seatLayout.count - 1
    {
      if column == 0 || column == seatLayout[row].count - 1
      {
        return "#"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied > 4 ? "L" : "#"
      }
    }
    else
    {
      if column == 0
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "N")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied > 4 ? "L" : "#"
      }
      else if column == seatLayout[row].count - 1
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "W")
          + GetFirstVisible(seatLayout, row, column, "N")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied > 4 ? "L" : "#"
      }
      else
      {
        let seenSeats = GetFirstVisible(seatLayout, row, column, "S")
          + GetFirstVisible(seatLayout, row, column, "SE")
          + GetFirstVisible(seatLayout, row, column, "SW")
          + GetFirstVisible(seatLayout, row, column, "N")
          + GetFirstVisible(seatLayout, row, column, "NW")
          + GetFirstVisible(seatLayout, row, column, "NE")
          + GetFirstVisible(seatLayout, row, column, "E")
          + GetFirstVisible(seatLayout, row, column, "W")

        let countOccupied = seenSeats.filter { $0 == "#" }.count

        return countOccupied > 4 ? "L" : "#"
      }
    }
  }

  return seatLayout[row][column]
}

func NumberOfOccupied(_ seatLayout: [[Character]]) -> Int
{
  var currentLayout = seatLayout
  var newLayout = seatLayout

  while true
  {
    for rowIndex in 0..<(currentLayout.count)
    {
      for columnIndex in 0..<(currentLayout[rowIndex].count)
      {
        if currentLayout[rowIndex][columnIndex] == "#" ||
          currentLayout[rowIndex][columnIndex] == "L"
        {
          newLayout[rowIndex][columnIndex] = TransformSeat(currentLayout, rowIndex, columnIndex)
        }
      }
    }

    if currentLayout == newLayout
    {
      break
    }

    currentLayout = newLayout
  }

  var occupied = 0

  for rowIndex in 0..<(currentLayout.count)
  {
    for columnIndex in 0..<(currentLayout[rowIndex].count)
    {
      if currentLayout[rowIndex][columnIndex] == "#"
      {
        occupied += 1
      }
    }
  }

  return occupied
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var inputLines = fileContent.split(separator: "\n").map { String($0) }

var seatLayout = inputLines.map { Array($0) }

print(NumberOfOccupied(seatLayout))