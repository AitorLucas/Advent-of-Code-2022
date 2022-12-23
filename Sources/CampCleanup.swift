//
//  CampCleanup.swift
//
//
//  Created by Aitor on 23/12/22.
//

import Foundation

struct CampCleanup {
  let input: String

  init(input: String) {
    self.input = input
  }

  init() {
    input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
  }

  func solve() {
    let elvesIds = input.components(separatedBy: "\n")
    print(elvesIds)

    func mountSet(withIds idsString: Substring) -> Set<Int> {
      let idSplitted = idsString.split(separator: "-")
      let startId = Int(idSplitted.first!)!
      let endId = Int(idSplitted.last!)!

      return Set(stride(from: startId, through: endId, by: 1).map { Int($0) })
    }

    var countFullyContained = 0
    var countOverlaps = 0
    elvesIds.forEach{ ids in
      let idsSplitted = ids.split(separator: ",")
      let firstIdsString = idsSplitted.first!
      let lastIdsString = idsSplitted.last!

      // Sets
      let first = mountSet(withIds: firstIdsString)
      let last = mountSet(withIds: lastIdsString)

      let diff = first.intersection(last)
      if diff == first || diff == last {
        // print("Inter", ids)
        countFullyContained += 1
      }

      // - Part two
      if !diff.isEmpty {
        // print("Over", ids)
        countOverlaps += 1
      }
    }
    print("Number of fully contained:", countFullyContained)
    print("Number of overlaps:", countOverlaps)
  }
}
