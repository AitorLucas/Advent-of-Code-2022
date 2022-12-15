import Foundation

let input = """
A Y
B X
C Z
"""

let roundsStrings = input.components(separatedBy: "\n")
let roundsMatrix = roundsStrings.map({ $0.components(separatedBy: " ") })

var score = 0
roundsMatrix.forEach({ round in
    var roundScore = 0
    let opponent = round[0]
    let myself = round[1]

    // Shape
    switch myself {
    case "X":
        roundScore += 1
    case "Y":
        roundScore += 2
    case "Z":
        roundScore += 3
    default:
        fatalError()
    }

    // Outcome
    switch (opponent, myself) {
        // Draw case
        case ("A", "X"),
            ("B", "Y"),
            ("C", "Z"):
            roundScore += 3
        case ("A", "Y"),
            ("B", "Z"),
            ("C", "X"):
            roundScore += 6
        // Lost case
        default:
            break
    }
    print(roundScore)
    score += roundScore
})
print("Final score:", score)

