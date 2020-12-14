import Foundation

func GetMemorySum(_ listOfInputs: [String]) -> Int
{
  var mask = ""
  var memory = [Int: Int]()

  for input in listOfInputs
  {
    if input.contains("mask")
    {
      mask = input.replacingOccurrences(of: "mask = ",  with: "")
    }
    else
    {
      var inputParameters = input.components(separatedBy: " = ").map { String($0) }
      let memoryLocation = Int(inputParameters[0]
        .replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression))!
      let value = Int(inputParameters[1])!
      var numberInBinary = Array(String(value, radix: 2))

      var numberWithMaskApplied = Array(mask)

      for index in 0..<(numberInBinary.count)
      {
        if numberWithMaskApplied[numberWithMaskApplied.count - 1 - index] == "X"
        {
          numberWithMaskApplied[numberWithMaskApplied.count - 1 - index] = numberInBinary[numberInBinary.count - index - 1]
        }
      }

      let saveToMemory = String(numberWithMaskApplied).replacingOccurrences(of: "X", with: "0")

      memory[memoryLocation] = Int(saveToMemory, radix: 2)!

    }
  }

  var sum = 0

  for ( _ , value) in memory
  {
    sum += value
  }

  return sum
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var listOfInputs = fileContent.split(separator: "\n").map { String($0) }

print(GetMemorySum(listOfInputs))