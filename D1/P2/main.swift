import Foundation

func CalculateFrequency (_ arrayOfEntries: [Int]) -> Int
{
  let copy = arrayOfEntries
  let copy2 = arrayOfEntries

  for entry in arrayOfEntries
  {
    for entry2 in copy
    {
      for entry3 in copy2
      {
        if entry + entry2 + entry3 == 2020
        {
          return entry * entry2 * entry3
          break
        } 
      }
      
    }
    
  }

  return 0
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var arrayOfInputs = fileContent.split(separator: "\n")
var changes = arrayOfInputs.map { Int($0)! }

print(CalculateFrequency(changes))