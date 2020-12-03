import Foundation

func CalculateCorrectPasswords (_ arrayOfEntries: [String]) -> Int
{
  var correctPasswords: Int = 0

  for entry in arrayOfEntries
  {
    let partsOfEntry = entry.split(separator: " ")

    let policy = partsOfEntry[0].split(separator: "-")
    let minNmb = Int(policy[0])!
    let maxNmb = Int(policy[1])!

    let letter = partsOfEntry[1].replacingOccurrences(of: ":", with: "", options: .literal, range: nil)

    let password = partsOfEntry[2]

    let passwordLettersCount = password.count

    let withoutLettersCount = password.replacingOccurrences(of: letter, with: "", options: .literal, range: nil).count

    let diff = passwordLettersCount - withoutLettersCount

    if diff <= maxNmb && diff >= minNmb
    {
      correctPasswords += 1
    }
  }

  return correctPasswords
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

var arrayOfInputs = fileContent.split(separator: "\n")
var changes = arrayOfInputs.map { String($0) }

print(CalculateCorrectPasswords(changes))