import Foundation

func ResolveFloating(_ memory: [Int: Int], _ floatingNumber: String, _ memValue: Int) -> [Int: Int]
{
  var copyOfMemory = memory
  if !floatingNumber.contains("X")
  {
    let valueOfLocation = Int(floatingNumber, radix: 2)!
    copyOfMemory[valueOfLocation] = memValue
    return copyOfMemory
  }

  var floatToArray = Array(floatingNumber)
  let indexOfX = floatToArray.firstIndex(of: "X")!

  for index in 0...1
  {
    floatToArray[indexOfX] = index == 0 ? "0" : "1"
    copyOfMemory = ResolveFloating(copyOfMemory, String(floatToArray), memValue)
  }

  return copyOfMemory

}

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
      var numberInBinary = Array(String(memoryLocation, radix: 2))

      var numberWithMaskApplied = Array(mask)

      for index in 0..<(numberInBinary.count)
      {
        if numberWithMaskApplied[numberWithMaskApplied.count - 1 - index] == "0"
        {
          numberWithMaskApplied[numberWithMaskApplied.count - 1 - index] = numberInBinary[numberInBinary.count - index - 1]
        }
      }

      memory = ResolveFloating(memory, String(numberWithMaskApplied), value)

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