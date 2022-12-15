import Foundation

let input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

let elvesIds = input.components(separatedBy: "\n")
print(elvesIds)

func mountSet(withIds idsString: Substring) -> Set<Int> {
    let idSplitted = idsString.split(separator: "-")
    let startId = Int(idSplitted.first!)!
    let endId = Int(idSplitted.last!)!

    return Set(stride(from: startId, through: endId, by: 1).map { Int($0) })
}

var count = 0
elvesIds.forEach{ ids in 
    let idsSplitted = ids.split(separator: ",")
    let firstIdsString = idsSplitted.first!
    let lastIdsString = idsSplitted.last!

    // Sets
    let first = mountSet(withIds: firstIdsString)
    let last = mountSet(withIds: lastIdsString)

    let diff = first.intersection(last)
    if diff == first || diff == last {
        print(ids)
        count += 1
    }
}
print(count)