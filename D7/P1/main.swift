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

func ContainsShinyGoldBag(_ rules: [String]?, 
  _ rulesDictionary: Dictionary<String, [String]?>) -> Bool
{
  if rules == nil
  {
    return false
  }

  for rule in rules!
  {
    if rule.contains("shiny gold")
    {
      return true
    }
  }

  for rule in rules!
  {
    let splitRule = rule.components(separatedBy: " ").map { String($0) }
    let containingBagColor = "\(splitRule[1]) \(splitRule[2])"

    let containsShinyGold = ContainsShinyGoldBag(rulesDictionary[containingBagColor]!, rulesDictionary)

    if containsShinyGold
    {
      return true
    }
  }

  return false
}

func ContainsShinyGoldBag(_ bagRules: Dictionary<String, [String]?>) -> Int
{
  var containShinyGold = 0

  for (bagColor, rules) in bagRules
  {
    if bagColor == "shiny gold"
    {
      continue
    }
     containShinyGold = ContainsShinyGoldBag(rules, bagRules) ? 
      containShinyGold + 1 : containShinyGold
  }

  return containShinyGold
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfBags = fileContent
    .replacingOccurrences(of: " bags", with: "", options: .literal, range: nil).replacingOccurrences(of: " bag", with: "", options: .literal, range: nil)
    .replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
    .split(separator: "\n").map { String($0) }

let dictionaryOfBags = CreateDictionary(arrayOfBags)

print(ContainsShinyGoldBag(dictionaryOfBags))