//
//  AdventOfCode2022.swift
//
//
//  Created by Aitor on 23/12/22.
//

import Darwin

@main
public struct AdventOfCode2022 {

  public static func main() {
    let selectedNumber = InputHandler.shared.requestChallengeSelection()
    let inputString = InputHandler.shared.requestFile(withDefaultNumber: selectedNumber)

    var challenge: Challenge?
    switch selectedNumber {
      case 1:
        challenge = CalorieCounting()
      case 2:
        challenge = RockPaperScissors()
      case 3:
        challenge = RucksackReorganization()
      case 4:
        challenge = CampCleanup()
      case 5:
        challenge = SupplyStacks()
      case 6:
        challenge = TuningTrouble()
      case 7:
        challenge = NoSpaceLeftOnDevice()
      case 8:
        challenge = TreetopTreeHouse()
      default:
        exit(EXIT_FAILURE)
    }
    challenge?.input = inputString
    challenge?.solve()
  }
}
