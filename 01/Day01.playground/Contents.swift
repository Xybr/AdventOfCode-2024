import Cocoa
import Foundation

/*
 Example Input:
 3   4
 4   3
 2   5
 1   3
 3   9
 3   3
 
 Sort by smallest numbers in each column.
 */

func calculateDistance(_ a: Int, _ b: Int) -> Int {
    return abs(a - b)
}

func orderedArray(_ input: [Int]) -> [Int] {
    return input.sorted()
}

func numberOfDuplicates(_ numberToFind: Int, _ input: [Int]) -> Int {
    var timesFound: Int = 0
    var seen: Set<Int> = []

    print("numberOfDuplicates: numberToFind: \(numberToFind)")
    print("numberOfDuplicates: Input: \(input)")
    
    // TODO: Overcounting found numbers...
    for number in 0..<input.count {
        if input[number] == numberToFind {
            timesFound += 1
        }
    }
    
    print("seen: \(seen)")
    print("\(numberToFind) found \(timesFound) times")
    return numberToFind * timesFound
}

func findDuplicates(_ input1: [Int], _ input2: [Int]) -> [Int] {
    var duplicates: [Int] = []
    var seen: Set<Int> = []
    var simalar: [Int] = []
    
    // TODO: Compare input1[i] to input2[0...count], count how many found for each input1 number.
    
    for input in input1 {
        if input2.contains(input) {
            duplicates.append(input)
        }
    }
    
    for input in duplicates {
        if input2.contains(input) {
            simalar.append(input)
        }
    }
    
    /*
    for number in input1 {
        print("Number: \(number)")
        if seen.contains(number) {
            duplicates.append(number)
        } else {
            seen.insert(number)
        }
    }
     */
    return duplicates
}

func part1() {
    // Part 1
    let testInput1: [Int] = [3, 4, 2, 1, 3, 3]
    let testInput2: [Int] = [4, 3, 5, 3, 9, 3]
    
    var orderedTestInput1 = orderedArray(testInput1)
    var orderedTestInput2 = orderedArray(testInput2)
    var testDistances: [Int] = []
    var totalDistance: Int = 0
    
    for i in 0...orderedTestInput1.count - 1 {
        testDistances.append(calculateDistance(orderedTestInput1[i], orderedTestInput2[i]))
    }
    
    print(testDistances)
    totalDistance = testDistances.reduce(0, +)
    print("Part 1's Test Answer is: \(totalDistance)")
    
    // /////////////////
    // Part 1
    
    var input1: [Int] = []
    var input2: [Int] = []
    
    if let path = Bundle.main.path(forResource: "aoc2024-01-input", ofType: "txt") {
        let input = try! String(contentsOf: URL(fileURLWithPath: path), encoding: String.Encoding.utf8)
        let lines = input.components(separatedBy: .newlines)
        
        //print(lines)
        var returnedLines:[String] = []
        for line in lines {
            returnedLines.append(line)
        }
        // print(returnedLines)
        
        for line in returnedLines {
            let numbers = line.components(separatedBy: .whitespaces)
            input1.append(Int(numbers[0])!)
            input2.append(Int(numbers[3])!)
        }
    }
    
    var orderedInput1 = orderedArray(input1)
    var orderedInput2 = orderedArray(input2)
    var distances: [Int] = []
    
    for i in 0...orderedInput1.count - 1 {
        // print("\(orderedInput1[i]), \(orderedInput2[i])")
        distances.append(calculateDistance(orderedInput1[i], orderedInput2[i]))
    }
    
    // print(distances)
    totalDistance = distances.reduce(0, +)
    // print("Part 1's Answer is: \(totalDistance)")
}

func part2() {
    // /////////////////////
    // Part 2
    //
    let testInput1: [Int] = [3, 4, 2, 1, 3, 3]
    let testInput2: [Int] = [4, 3, 5, 3, 9, 3]
    
    var input1: [Int] = []
    var input2: [Int] = []
    
    if let path = Bundle.main.path(forResource: "aoc2024-01-input", ofType: "txt") {
        let input = try! String(contentsOf: URL(fileURLWithPath: path), encoding: String.Encoding.utf8)
        let lines = input.components(separatedBy: .newlines)
        
        //print(lines)
        var returnedLines:[String] = []
        for line in lines {
            returnedLines.append(line)
        }
        // print(returnedLines)
        
        for line in returnedLines {
            let numbers = line.components(separatedBy: .whitespaces)
            input1.append(Int(numbers[0])!)
            input2.append(Int(numbers[3])!)
        }
    }
    
    var scoreList: [Int] = []
    // var testAnswer: Int = numberOfDuplicates(testInput1[0], testInput2)
    // print("Part 2: Test Answer is: \(testAnswer)")
    
    for i in 0 ..< input1.count {
        scoreList.append(numberOfDuplicates(input1[i], input2))
    }
    
    var sum = scoreList.reduce(0, +)
    print ("Part 2's Answer is: \(sum)")
}

// part1()
part2()
