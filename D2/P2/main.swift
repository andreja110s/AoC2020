import Foundation

func CalculateCorrectPasswords (_ arrayOfEntries: [String]) -> Int
{
  var correctPasswords: Int = 0

  for entry in arrayOfEntries
  {
    let partsOfEntry = entry.split(separator: " ")

    let policy = partsOfEntry[0].split(separator: "-")
    let index1 = Int(policy[0])!
    let index2 = Int(policy[1])!

    let letter = Character(partsOfEntry[1].replacingOccurrences(of: ":", with: "", options: .literal, range: nil))

    let passwordLetters = Array(partsOfEntry[2])

    if (passwordLetters[index1-1] == letter && passwordLetters[index2-1] != letter)
    {
      correctPasswords += 1
    }
    else if (passwordLetters[index1-1] != letter && passwordLetters[index2-1] == letter)
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