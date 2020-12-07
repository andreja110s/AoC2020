import Foundation

func CreateDictionary(_ bagRules: [String]) -> Dictionary<String, [String]?>
{
  var dictionaryOfBags = [String : [String]?]()

  for bagRule in bagRules
  {
    let partsOfRule = bagRule.components(separatedBy: " contain ")
    let mainBag = partsOfRule[0]
    let bagContents = partsOfRule[1].rangeOfCharacter(from: .decimalDigits) != nil ?
    partsOfRule[1].components(separatedBy: ", ") : nil

    dictionaryOfBags[mainBag] = bagContents
  }

  return dictionaryOfBags
}

func ContainsNumberOfBags(_ rules: [String]?, 
  _ rulesDictionary: Dictionary<String, [String]?>) -> Int
{
  if rules == nil
  {
    return 0
  }

  var numberOfBags = 0

  for rule in rules!
  {
    let splitRule = rule.components(separatedBy: " ").map { String($0) }
    let containingBagColor = "\(splitRule[1]) \(splitRule[2])"

    let nmbOfThisColor = Int(splitRule[0])!

    for _ in 1...nmbOfThisColor
    {
      numberOfBags += ContainsNumberOfBags(rulesDictionary[containingBagColor]!, rulesDictionary) + 1
    }

  }

  return numberOfBags
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfBags = fileContent
    .replacingOccurrences(of: " bags", with: "", options: .literal, range: nil).replacingOccurrences(of: " bag", with: "", options: .literal, range: nil)
    .replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
    .split(separator: "\n").map { String($0) }

let dictionaryOfBags = CreateDictionary(arrayOfBags)

print(ContainsNumberOfBags(dictionaryOfBags["shiny gold"]!, dictionaryOfBags))