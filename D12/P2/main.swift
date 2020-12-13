import Foundation

class Ship
{
  var relativeX: Int
  var relativeY: Int
  var waypointX: Int
  var waypointY: Int

  init(_ x: Int, _ y: Int)
  {
    self.relativeX = 0
    self.relativeY = 0
    self.waypointX = x
    self.waypointY = y
  }

  func ExecuteCommand(_ command: String)
  {
    let commandType = command.prefix(1)
    var commandValue = Int(command.suffix(command.count - 1))!

    switch commandType
    {
      case "N":
        self.waypointY += commandValue

      case "S":
        self.waypointY -= commandValue

      case "E":
        self.waypointX += commandValue

      case "W":
        self.waypointX -= commandValue

      case "L":

        commandValue = (commandValue % 360) / 90

        let tmpX = self.waypointX
        let tmpY = self.waypointY

        if commandValue == 1
        {
          self.waypointX = tmpY * -1
          self.waypointY = tmpX
        }
        else if commandValue == 2
        {
          self.waypointX = tmpX * -1
          self.waypointY = tmpY * -1
        }
        else if commandValue == 3
        {
          self.waypointX = tmpY
          self.waypointY = tmpX * -1
        }

      case "R":

        commandValue = 360 - (commandValue % 360)

        let newCommand = "L" + String(commandValue)

        ExecuteCommand(newCommand)

      case "F":

        self.relativeX += self.waypointX * commandValue
        self.relativeY += self.waypointY * commandValue

      default:
        print("Invalid command")
    }
  }
}

func GetManhattanDistance(_ ship: Ship, _ commands: [String]) -> Int
{
  for command in commands
  {
    ship.ExecuteCommand(command)
  }

  let absoluteX = abs(ship.relativeX)
  let absoluteY = abs(ship.relativeY)

  return absoluteX + absoluteY
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var listOfCommands = fileContent.split(separator: "\n").map { String($0) }

var ship = Ship(10, 1)

print(GetManhattanDistance(ship, listOfCommands))