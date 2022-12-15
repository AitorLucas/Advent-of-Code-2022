import Foundation

let input = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

let elvesVector = input.components(separatedBy: "\n\n")
let caloriesMatrix = elvesVector.map({ $0.components(separatedBy: "\n").map({ Int($0)! }) })
let caloriesWithElves = caloriesMatrix.map({ $0.reduce(0, +) })
let maxCalories = caloriesWithElves.max()!

print(maxCalories)