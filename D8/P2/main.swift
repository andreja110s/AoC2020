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
  var readOnlyInstructions : [Instruction]

  init(_ instructions: [String])
  {
    self.accumulator = 0
    self.index = 0
    self.instructions = [Instruction]()
    self.readOnlyInstructions = [Instruction]()

    for instruction in instructions
    {
      let partsOfInstruction = instruction.components(separatedBy: " ").map { String($0) }
      var parsedInstruction = Instruction()
      parsedInstruction.operation = partsOfInstruction[0]
      parsedInstruction.argument = partsOfInstruction[1]

      self.instructions.append(parsedInstruction)
      self.readOnlyInstructions.append(parsedInstruction)
    }
  }

  func ResetProgram()
  {
    self.accumulator = 0
    self.index = 0
    self.instructions = self.readOnlyInstructions
  }

  func ChangeInstruction(_ indexOfInstruction: Int)
  {
    if self.instructions[indexOfInstruction].operation == "jmp"
    {
      self.instructions[indexOfInstruction].operation = "nop"
    }
    else if self.instructions[indexOfInstruction].operation == "nop"
    {
      self.instructions[indexOfInstruction].operation = "jmp"
    }
    else
    {
      print("Something went wrong: invalid instruction for change")
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

func FindValueInAccumulator (_ program: Program) -> Int?
{
  var alreadyExecuted = [Int]()
  alreadyExecuted.append(0)

  while true
  {
    program.ExecuteProgram()

    if alreadyExecuted.contains(program.index)
    {
      return nil
    }
    else if program.index >= program.instructions.count
    {
      return program.accumulator
    }
    else
    {
      alreadyExecuted.append(program.index)
    }
  }
}

func FindAndChangeOperation(_ program: Program, _ indexOfNopJmp: [Int])
{
  for index in indexOfNopJmp
  {
    program.ResetProgram()

    program.ChangeInstruction(index)

    if FindValueInAccumulator(program) != nil
    {
      print(program.accumulator)
      return
    }

  }
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfInstructions = fileContent.split(separator: "\n").map { String($0) }

var indexOfNopJmp = [Int]()

for index in 0...arrayOfInstructions.count-1
{
  if arrayOfInstructions[index].contains("nop") 
    || arrayOfInstructions[index].contains("jmp")
  {
    indexOfNopJmp.append(index)
  }
}

var thisProgram = Program(arrayOfInstructions)

FindAndChangeOperation(thisProgram, indexOfNopJmp)