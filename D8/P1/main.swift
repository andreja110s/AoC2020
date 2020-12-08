import Foundation

struct Instruction
{
  var operation: String = "0"
  var argument: String = "0"
}

class Program
{
  var accumulator: Int
  var index: Int
  var instructions: [Instruction]

  init(_ instructions: [String])
  {
    self.accumulator = 0
    self.index = 0
    self.instructions = [Instruction]()

    for instruction in instructions
    {
      let partsOfInstruction = instruction.components(separatedBy: " ").map { String($0) }
      var parsedInstruction = Instruction()
      parsedInstruction.operation = partsOfInstruction[0]
      parsedInstruction.argument = partsOfInstruction[1]

      self.instructions.append(parsedInstruction)
    }
  }

  func ExecuteProgram()
  {
    if self.index >= self.instructions.count
    {
      return
    }

    let thisCommand = self.instructions[self.index]

    switch thisCommand.operation
    {
      case "acc":

        let value = String(thisCommand.argument.suffix(thisCommand.argument.count-1))

        if thisCommand.argument.prefix(1) == "+"
        {
          self.accumulator += Int(value)!
        }
        else if thisCommand.argument.prefix(1) == "-"
        {
          self.accumulator -= Int(value)!
        }
        else
        {
          print("Something went wrong: acc")
        }

        self.index += 1

      case "jmp":

        let value = String(thisCommand.argument.suffix(thisCommand.argument.count-1))

        if thisCommand.argument.prefix(1) == "+"
        {
          self.index += Int(value)!
        }
        else if thisCommand.argument.prefix(1) == "-"
        {
          self.index -= Int(value)!
        }
        else
        {
          print("Something went wrong: jmp")
        }
      case "nop":

        self.index += 1

      default:
        print("Something went wrong: default")
    }
  }
}

func FindValueInAccumulator (_ program: Program) -> Int
{
  var alreadyExecuted = [Int]()
  alreadyExecuted.append(0)

  while true
  {
    program.ExecuteProgram()

    if (alreadyExecuted.contains(program.index))
    {
      return program.accumulator
    }
    else
    {
      alreadyExecuted.append(program.index)
    }
  }
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfInstructions = fileContent.split(separator: "\n").map { String($0) }

var thisProgram = Program(arrayOfInstructions)

print(FindValueInAccumulator(thisProgram))