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

    let inputString = InputHandler().requestFile()
    let cCounting = CalorieCounting(input: inputString)
    cCounting.solve()
  }
}

