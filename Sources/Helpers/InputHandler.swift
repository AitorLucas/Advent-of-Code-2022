//
//  InputHandler.swift
//  
//
//  Created by Aitor on 23/12/22.
//

import Darwin

struct InputHandler {

  static var shared = InputHandler()

  func requestChallengeSelection() -> Int {
    var challengeNumber = 1

    print("Enter the challenge number (press enter for default: \(challengeNumber)): ")
    if let challenge = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
       !challenge.isEmpty {

      guard let number = Int(challenge),
            (1...24).contains(number) else {
        print("Can't find challenge with choosed number: \(challenge)")
        exit(EXIT_FAILURE)
      }

      challengeNumber = number
    }

    return challengeNumber
  }

  func requestFile(withDefaultNumber defaultNumber: Int = 1) -> String {
    var directoryPath = "/Users/Aitor/Desktop/Advent-of-Code-2022/Resources"
    var resourcePath = "/\(String(format: "%02d", defaultNumber))/Input.txt"

    print("Enter xcode project path (press enter for default: \(directoryPath)): ")
    if let directory = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
       !directory.isEmpty {
      directoryPath = directory
    }

    print("Enter resource input subpath (press enter for default: \(resourcePath)): ")
    if let resource = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
       !resource.isEmpty {
      resourcePath = resource
    }

    guard let inputString = try? String(String(contentsOfFile: directoryPath + resourcePath)) else {
      print("Can't find input file for: \(directoryPath + resourcePath)")
      exit(EXIT_FAILURE)
    }

    return inputString
  }
}
