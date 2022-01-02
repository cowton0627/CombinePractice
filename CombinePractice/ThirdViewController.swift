//
//  ThirdViewController.swift
//  CombinePractice
//
//  Created by Chun-Li Cheng on 2021/12/28.
//

import UIKit
import Algorithms
import VideoToolbox

struct Student {
    let name: String
    let grade: String
}

class ThirdViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    let names1 = ["Jane", "Elizabeth", "Mary", "Kitty"]
    let names2 = ["Daphane", "Eloise", "Francesca", "Hyacinth"]
    
    let tooLow = 0...20
    let tooHigh = 80...100
    let value = 35
    
    let reservedSeats = 0...50
    let unvaliableSeats = [61, 68, 75, 76, 77, 91]
    
    let results = [
        Student(name: "Taylor", grade: "A"),
        Student(name: "Sophia", grade: "A"),
        Student(name: "Bella", grade: "B"),
        Student(name: "Rajesh", grade: "C"),
        Student(name: "Tony", grade: "C"),
        Student(name: "Theresa", grade: "D"),
        Student(name: "Boris", grade: "F")
    ]
    
    let lotteryBalls = 1...50
    
    let people = ["Chidi", "Eleanor", "Jason", "Tahani", "Hana"]
    
//    let numbers = 1...500
    
    let inputString = "0a1b2c3d4e5f6g7h8i9j"
    
    let allNumbers = [3, 7, 8, 7, 8, 67, 8 ,17 ,13 ,1]
    
//    let nums = [10, nil, 20, nil, 30]
    
    let games = ["Mario Kart", "Zelda"]
    
    let range = 1...12
    let questionCount = 3
    
    let suspects = ["Colonel Mustard", "Professor", "Mrs White", "Uncle Ben"]
    let locations = ["Kitchen", "Library", "Bus Station"]
    let weapons = ["Candlestick", "Daggar", "Lead Pipe", "Rope"]
    
    let numbers = (1...501).windows(ofCount: 5)
//        .adjacentPairs()
    
    let names = ["Jason", "Paul", "Robinson", "Mary"]
    
    let scores = [42, 4, 13, 7, 58]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let threeLowest = scores.min(count: 3)
        print(threeLowest)
        
//        if let (first, last) = names.minAndMax() {
//            print(first)
//            print(last)
//        }
        
//        for group in numbers {
////            print("Pairs: \(pair.0) and \(pair.1)")
//            let strings = group.map(String.init)
//            print(ListFormatter.localizedString(byJoining: strings))
//        }
        
//        let guesses = product(product(suspects, locations), weapons)
////            .randomSample(count: questionCount)
//        for guess in guesses {
//            print("Case: \(guess.0.0) in \(guess.0.1) use the \(guess.1) for a murder weapon.")
//        }
        
//        let allMultiples = product(range, range).randomSample(count: questionCount)
////            .shuffled().prefix(questionCount)
//        for pair in allMultiples {
//            print("\(pair.0) x \(pair.1) = \(pair.0 * pair.1)")
//        }
        
//        let allOptions = product(people, games)
//        for option in allOptions {
//            print("\(option.0) will play \(option.1)")
//        }
        
//        // compacted always lazy
//        let safeNums = nums.compacted()
//        print(safeNums)
        
//        let selectedResults = results.uniqued(on: \.grade)
//        for selectedResult in selectedResults {
//            print("Grade\(selectedResult.grade): \(selectedResult.name)")
//        }
        
//        let uniqueNumbers = allNumbers.uniqued().sorted()
//
//        for number in uniqueNumbers {
//            print("\(number)")
//        }
        
//        let letters = inputString.striding(by: 2)
//        for letter in letters {
//            print(letter)
//        }
        
//        let oddNumbers = stride(from: numbers.lowerBound+400, through: numbers.upperBound, by: 2)
//        for oddNumber in oddNumbers {
//            print(oddNumber)
//        }
        
//        let selected = results.randomSample(count: 2).map(\.grade)
//        print(selected)
        
//        let winningNumbers = lotteryBalls.randomSample(count: 7)
//        print(winningNumbers)
        
//        let pairs = results.chunks(ofCount: 2).map(Array.init)
//        for pair in pairs {
////            let names = ListFormatter.localizedString(byJoining: pair.map(\.name))
////            print(names)
//
//            if pair.count == 2 {
//                print("\(pair[0].name) and \(pair[1].name) are working together.")
//            } else {
//                print("\(pair[0].name) is working alone.")
//            }
//        }
        
        //        let studentsByName = results.sorted{ $0.name < $1.name }.chunked(on: \.name.first!)
        //        for (firstLetter, students) in studentsByName {
        //            print("Name's firstLetter: \(firstLetter)")
        //
        //            for student in students {
        //                print("\t\(student.name)")
        //            }
        //        }
        
        //        let studentsByGrade = results.chunked(on: \.grade)
        //        for (grade, students) in studentsByGrade {
        //            print("Grade: \(grade)")
        //
        //            for student in students {
        //                print("\t\(student.name)")
        //            }
        //        }
        
//        let disallowed = chain(reservedSeats, unvaliableSeats)
//        let requestSeat = 51
//        print(disallowed.contains(requestSeat))
        
//        let outOfBounds = chain(tooLow, tooHigh)
//        print(outOfBounds.contains(value))
        
//        for name in names1 + names2 {
//            print(name)
//        }
//        for name in chain(names1, names2) {
//            print(name)
//        }

    }
    



}
