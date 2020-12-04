import Foundation

class Passport
{
  var birthYear: Int
  var issueYear: Int
  var expirationYear: Int
  var heightNumber: Int
  var heightType: String
  var hairColor: String
  var eyeColor: String
  var passportId: String

  init(_ birthYear: Int,
    _ issueYear: Int,
    _ expirationYear: Int,
    _ heightNumber: Int,
    _ heightType: String,
    _ hairColor: String,
    _ eyeColor: String,
    _ passportId: String)
  {
    self.birthYear = birthYear
    self.issueYear = issueYear
    self.expirationYear = expirationYear
    self.heightNumber = heightNumber
    self.heightType = heightType
    self.hairColor = hairColor
    self.eyeColor = eyeColor
    self.passportId = passportId
  }

  func HasValidHeight() -> Bool
  {
    if heightType == "in"
    {
      return heightNumber > 58 && heightNumber < 77
    }
    else if heightType == "cm"
    {
      return heightNumber > 149 && heightNumber < 194
    }
    else
    {
      return false
    }
  }

  func HasValidHairColor() -> Bool
  {
    let pattern = #"([a-f]|\d)"#
    let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
    let stringRange = NSRange(location: 0, length: hairColor.count)

    return hairColor.count == 7
    && String(hairColor.prefix(1)) == "#"
    && regex.matches(in: hairColor, range: stringRange).count > 0
  }

  func HasValidEyeColor() -> Bool
  {
    return eyeColor == "amb" || eyeColor == "blu"
    || eyeColor == "brn" || eyeColor == "gry"
    || eyeColor == "grn" || eyeColor == "hzl"
    || eyeColor == "oth"
  }

  func HasValidPassportId() -> Bool
  {
    let pattern = #"\d"#
    let regex = try! NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
    let stringRange = NSRange(location: 0, length: passportId.count)

    return passportId.count == 9 && regex.matches(in: passportId, range: stringRange).count > 0
  }

  func HasValidValues() -> Bool
  {
    return birthYear > 1919 && birthYear < 2003
    && issueYear > 2009 && issueYear < 2021
    && expirationYear > 2019 && expirationYear < 2031
    && HasValidHeight() && HasValidHairColor() && HasValidEyeColor() && HasValidPassportId()
  }
}

func InitialisePassport(_ passportString: String) -> Passport
{
  let passportInformation = passportString.split(separator: "\n").map { String($0) }

  let passport = Passport(0, 0, 0, 0, "", "", "", "")

  for info in passportInformation
  {
    let partsOfInfo = info.split(separator: ":")

    if partsOfInfo[0] == "byr"
    {
      passport.birthYear = Int(partsOfInfo[1])!
    }
    else if partsOfInfo[0] == "iyr"
    {
      passport.issueYear = Int(partsOfInfo[1])!
    }
    else if partsOfInfo[0] == "eyr"
    {
      passport.expirationYear = Int(partsOfInfo[1])!
    }
    else if partsOfInfo[0] == "hgt"
    {
      if partsOfInfo[1].count < 3
      {
        passport.heightNumber = 0
        passport.heightType  = String("")
      }
      else
      {
        passport.heightNumber = Int(partsOfInfo[1].prefix(partsOfInfo[1].count-2))!
        passport.heightType  = String(partsOfInfo[1].suffix(2))
      }
    }
    else if partsOfInfo[0] == "hcl"
    {
      passport.hairColor = String(partsOfInfo[1])
    }
    else if partsOfInfo[0] == "ecl"
    {
      passport.eyeColor = String(partsOfInfo[1])
    }
    else if partsOfInfo[0] == "pid"
    {
      passport.passportId = String(partsOfInfo[1])
    }
  }

  return passport
}

func IsPassportValid(_ passportString: String) -> Bool
{
  let passportParts = passportString.split(separator: "\n")

  if passportParts.count < 7 || passportParts.count > 8
  {
    return false
  }

  if passportString.contains("byr:") && passportString.contains("iyr:")
  && passportString.contains("eyr:") && passportString.contains("hgt:")
  && passportString.contains("hcl:") && passportString.contains("ecl:")
  && passportString.contains("pid:")
  {
    let passportObject = InitialisePassport(passportString)
    return passportObject.HasValidValues()
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