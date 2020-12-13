import Foundation

func TransformSeat(_ seatLayout: [[Character]], _ row: Int, _ column: Int) -> Character
{
  if seatLayout[row][column] == "L"
  {
    if row == 0
    {
      if column == 0
      {
        if seatLayout[row + 1][column] != "#"
          && seatLayout[row + 1][column + 1] != "#"
          && seatLayout[row][column + 1] != "#"
        {
          return "#"
        }
      }
      else if column == seatLayout[row].count - 1
      {
        if seatLayout[row + 1][column] != "#"
          && seatLayout[row + 1][column - 1] != "#"
          && seatLayout[row][column - 1] != "#"
        {
          return "#"
        }
      }
      else
      {
        if seatLayout[row + 1][column] != "#"
          && seatLayout[row + 1][column - 1] != "#"
          && seatLayout[row][column - 1] != "#"
          && seatLayout[row + 1][column + 1] != "#"
          && seatLayout[row][column + 1] != "#"
        {
          return "#"
        }
      }
    }
    else if row == seatLayout.count - 1
    {
      if column == 0
      {
        if seatLayout[row - 1][column] != "#"
          && seatLayout[row - 1][column + 1] != "#"
          && seatLayout[row][column + 1] != "#"
        {
          return "#"
        }
      }
      else if column == seatLayout[row].count - 1
      {
        if seatLayout[row - 1][column] != "#"
          && seatLayout[row - 1][column - 1] != "#"
          && seatLayout[row][column - 1] != "#"
        {
          return "#"
        }
      }
      else
      {
        if seatLayout[row - 1][column] != "#"
          && seatLayout[row - 1][column + 1] != "#"
          && seatLayout[row][column + 1] != "#"
          && seatLayout[row][column - 1] != "#"
          && seatLayout[row - 1][column - 1] != "#"
        {
          return "#"
        }
      }
    }
    else
    {
      if column == 0
      {
        if seatLayout[row][column + 1] != "#"
          && seatLayout[row + 1][column] != "#"
          && seatLayout[row + 1][column + 1] != "#"
          && seatLayout[row - 1][column + 1] != "#"
          && seatLayout[row - 1][column] != "#"
        {
          return "#"
        }
      }
      else if column == seatLayout[row].count - 1
      {
        if seatLayout[row][column - 1] != "#"
          && seatLayout[row + 1][column] != "#"
          && seatLayout[row + 1][column - 1] != "#"
          && seatLayout[row - 1][column - 1] != "#"
          && seatLayout[row - 1][column] != "#"
        {
          return "#"
        }
      }
      else
      {
        if seatLayout[row][column + 1] != "#"
          && seatLayout[row][column - 1] != "#"
          && seatLayout[row + 1][column] != "#"
          && seatLayout[row - 1][column] != "#"
          && seatLayout[row + 1][column - 1] != "#"
          && seatLayout[row + 1][column + 1] != "#"
          && seatLayout[row - 1][column - 1] != "#"
          && seatLayout[row - 1][column + 1] != "#"
        {
          return "#"
        }
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
        let seatsAround = String(seatLayout[row + 1][column])
          + String(seatLayout[row + 1][column - 1])
          + String(seatLayout[row][column - 1])
          + String(seatLayout[row + 1][column + 1])
          + String(seatLayout[row][column + 1])
        
        let countOccupied = seatsAround.filter { $0 == "#" }.count

        return countOccupied > 3 ? "L" : "#"
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
        let seatsAround = String(seatLayout[row - 1][column])
          + String(seatLayout[row - 1][column + 1])
          + String(seatLayout[row][column + 1])
          + String(seatLayout[row][column - 1])
          + String(seatLayout[row - 1][column - 1])
        
        let countOccupied = seatsAround.filter { $0 == "#" }.count

        return countOccupied > 3 ? "L" : "#"
      }
    }
    else
    {
      if column == 0
      {
        let seatsAround = String(seatLayout[row][column + 1])
          + String(seatLayout[row + 1][column])
          + String(seatLayout[row + 1][column + 1])
          + String(seatLayout[row - 1][column + 1])
          + String(seatLayout[row - 1][column])
        
        let countOccupied = seatsAround.filter { $0 == "#" }.count

        return countOccupied > 3 ? "L" : "#"
      }
      else if column == seatLayout[row].count - 1
      {
        let seatsAround = String(seatLayout[row][column - 1])
          + String(seatLayout[row + 1][column])
          + String(seatLayout[row + 1][column - 1])
          + String(seatLayout[row - 1][column - 1])
          + String(seatLayout[row - 1][column])
        
        let countOccupied = seatsAround.filter { $0 == "#" }.count

        return countOccupied > 3 ? "L" : "#"
      }
      else
      {
        let seatsAround = String(seatLayout[row][column + 1])
          + String(seatLayout[row][column - 1])
          + String(seatLayout[row + 1][column])
          + String(seatLayout[row - 1][column])
          + String(seatLayout[row + 1][column - 1])
          + String(seatLayout[row + 1][column + 1])
          + String(seatLayout[row - 1][column - 1])
          + String(seatLayout[row - 1][column + 1])
        
        let countOccupied = seatsAround.filter { $0 == "#" }.count

        return countOccupied > 3 ? "L" : "#"
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