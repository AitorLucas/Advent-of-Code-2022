import Foundation

let input = """
A Y
B X
C Z
"""

let roundsStrings = input.components(separatedBy: "\n")
let roundsMatrix = roundsStrings.map({ $0.components(separatedBy: " ") })

func calculateScore(for round: [String]) -> Int {
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
        // Win case
        case ("A", "Y"),
            ("B", "Z"),
            ("C", "X"):
            roundScore += 6
        // Lost case
        default:
            break
    }
    return roundScore
}

var score = 0
roundsMatrix.forEach({ round in
    let roundScore = calculateScore(for: round)
    print(roundScore)
    score += roundScore
})
print("Final score:", score)

// - Part two
// X = Lose
// Y = Draw
// Z = Win

score = 0
roundsMatrix.forEach({ round in 
    let opponent = round[0]
    let roundResult = round[1]
    var myself = ""
    switch (opponent, roundResult) {
        // Lose cases
        case ("A", "X"):
            myself = "C"
        case ("B", "X"):
            myself = "A"
        case ("C", "X"):
             myself = "B"
        // Draw cases
        case (_, "Y"):
             myself = opponent
        // Win cases
        case ("A", "Z"):
            myself = "B"
        case ("B", "Z"):
            myself = "C"
        case ("C", "Z"):
            myself = "A"
        default:
            fatalError()
    }
    myself = myself.replacingOccurrences(of: "A", with: "X")
                .replacingOccurrences(of: "B", with: "Y")
                .replacingOccurrences(of: "C", with: "Z")

    let roundScore = calculateScore(for: [opponent, myself])
    print(roundScore)
    score += roundScore
})
print("Final Score:", score)