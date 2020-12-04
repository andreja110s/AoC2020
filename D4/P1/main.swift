import Foundation

func IsPassportValid(_ passport: String) -> Bool
{
  let passportParts = passport.split(separator: "\n")

  if passportParts.count < 7 || passportParts.count > 8
  {
    return false
  }

  if passport.contains("byr:") && passport.contains("iyr:")
  && passport.contains("eyr:") && passport.contains("hgt:")
  && passport.contains("hcl:") && passport.contains("ecl:")
  && passport.contains("pid:")
  {
    return true
  }
  else
  {
    return false
  }
}

func CalculateValidPassports(_ listOfPassports: [String]) -> Int
{
  var numberOfValidPassports = 0

  for passport in listOfPassports
  {
    if IsPassportValid(passport)
    {
      numberOfValidPassports += 1
    }
  }

  return numberOfValidPassports
}

let path = Bundle.main.path(forResource: "input", ofType: "txt")
let fileContent = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)

let parsedInput = fileContent.replacingOccurrences(of: " ", with: "\n")

let arrayOfPassports = parsedInput.components(separatedBy: "\n\n").map { String($0) }

print(CalculateValidPassports(arrayOfPassports))