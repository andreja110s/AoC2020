import Foundation

class Ship
{
  var facingDirection: Int
  // 0 - East
  // 1 - North
  // 2- West
  // 3 - South
  var relativeX: Int
  var relativeY: Int

  init(_ direction: Int)
  {
    self.facingDirection = direction
    self.relativeX = 0
    self.relativeY = 0
  }

  func ExecuteCommand(_ command: String)
  {
    let commandType = command.prefix(1)
    var commandValue = Int(command.suffix(command.count - 1))!

    switch commandType
    {
      case "N":
        self.relativeY += commandValue
      case "S":
        self.relativeY -= commandValue
      case "E":
        self.relativeX += commandValue
      case "W":
        self.relativeX -= commandValue
      case "L":

        commandValue = (commandValue % 360) / 90

        self.facingDirection = (self.facingDirection + commandValue) % 4

      case "R":

        commandValue = (commandValue % 360) / 90

        self.facingDirection = (self.facingDirection - commandValue + 4) % 4

      case "F":

        if self.facingDirection == 0
        {
          self.relativeX += commandValue
        }
        else if self.facingDirection == 1
        {
          self.relativeY += commandValue
        }
        else if self.facingDirection == 2
        {
          self.relativeX -= commandValue
        }
        else if self.facingDirection == 3
        {
          self.relativeY -= commandValue
        }

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

var ship = Ship(0)

print(GetManhattanDistance(ship, listOfCommands))