import Foundation

func CalculateGroupYesAnswers(_ groupAnswers: String) -> Int
{
  let groupPersonAnswers = (groupAnswers.split(separator: "\n").map { String($0) }).map { Set(Array($0)) }
  
  var uniqueYesAnswers = groupPersonAnswers[0]

  for personAnswers in groupPersonAnswers
  {
    uniqueYesAnswers = uniqueYesAnswers.union(personAnswers)
  }

  return uniqueYesAnswers.count
}

func SumOfCounts(_ arrayOfGroups: [String]) -> Int
{
  var sum = 0

  for group in arrayOfGroups
  {
    sum += CalculateGroupYesAnswers(group)
  }

  return sum
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let arrayOfGroups = fileContent.components(separatedBy: "\n\n")

print(SumOfCounts(arrayOfGroups))