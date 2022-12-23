//
//  InputHandler.swift
//  
//
//  Created by Aitor on 23/12/22.
//

import Darwin

struct InputHandler {

  func requestFile() -> String {
    var directoryPath = "/Users/Aitor/Desktop/Advent-of-Code-2022/Resources"
    var resourcePath = "/01/Input.txt"

    print("Enter xcode project path (press enter for default: \(directoryPath)): ")
    if let directory = readLine(),
       !directory.isEmpty {
      directoryPath = directory
    }

    print("Enter resource input subpath (press enter for default: \(resourcePath)): ")
    if let resource = readLine(),
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
