//
//  RucksackReorganization.swift
//
//
//  Created by Aitor on 23/12/22.
//

import Foundation

struct RucksackReorganization {
  let input: String

  init(input: String) {
    self.input = input
  }

  init() {
    input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
  }

  func solve() {
    let bagsStrings = input.components(separatedBy: "\n")

    func calculatePriority(for diff: Set<Substring.Element>) -> Int {
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
      return priority
    }

    var sum = 0
    bagsStrings.forEach { bag in
      let start = bag.startIndex
      let middle = bag.index(start, offsetBy: bag.count/2)
      let end = bag.endIndex
      let firstHalf = Set(bag[start..<middle])
      let lastHalf = Set(bag[middle..<end])

      let diff = firstHalf.intersection(lastHalf)

      let priority = calculatePriority(for: diff)
      print(priority)
      sum += priority
    }
    print("Sum:", sum)

    // - Part two
    let groupsBagsStrings = stride(from: 0, through: bagsStrings.count-1, by: 3).map({
      let start = bagsStrings.index(bagsStrings.startIndex, offsetBy: $0)
      let end = bagsStrings.index(start, offsetBy: 3, limitedBy: bagsStrings.endIndex) ?? bagsStrings.endIndex
      return Array(bagsStrings[start..<end])
    })

    sum = 0
    groupsBagsStrings.forEach { group in
      let firstBag = Set(group[0])
      let secondBag = Set(group[1])
      let thirdBag = Set(group[2])

      let diff = firstBag.intersection(secondBag).intersection(thirdBag)

      let priority = calculatePriority(for: diff)
      print(priority)
      sum += priority
    }
    print("Sum:", sum)
  }
}
