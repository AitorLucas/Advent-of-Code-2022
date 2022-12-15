import Foundation

let input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

let bagsStrings = input.components(separatedBy: "\n")

var sum = 0
bagsStrings.forEach { bag in
    let start = bag.startIndex
    let middle = bag.index(start, offsetBy: bag.count/2)
    let end = bag.endIndex
    let firstHalf = Set(bag[start..<middle])
    let lastHalf = Set(bag[middle..<end])

    let diff = firstHalf.intersection(lastHalf)
    let character = Character(extendedGraphemeClusterLiteral: diff.first!)
    let asciiValue = Int(character.asciiValue!)

    var priority = 0
    // Lowercase
    if asciiValue >= 97 && asciiValue <= 122 {
        priority = asciiValue - 96
    }
    // Uppercase
    else if asciiValue >= 65 && asciiValue <= 90 {
        priority = asciiValue - 38
    }
    else {
        fatalError("Character out of bounds: \(character)")
    }
    print(priority)
    sum += priority
}
print("Sum:", sum)