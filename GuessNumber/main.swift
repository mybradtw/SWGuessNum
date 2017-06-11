//
//  main.swift
//  GuessNumber
//
//  Created by 趙令文 on 2017/6/11.
//  Copyright © 2017年 趙令文. All rights reserved.
//

import Foundation

var args = CommandLine.arguments
for arg in args {
    print(arg)
}

func createAnswer(n:Int) ->String {
    var r = Set<Int>()
    while r.count < n {
        let rand = Int(arc4random_uniform(10));
        r.insert(rand)
    }
    var ret = ""
    for v in r {
        ret += String(v)
    }
    return ret
}

func checkAB(answer:String, guess:String) -> String {
    var A = 0, B = 0
    for i in 0..<answer.characters.count {
        let ac = substring(str: answer, start: i, len: 1)
        let gc = substring(str: guess, start: i, len: 1)
        if ac == gc {
            A += 1
        }else if answer.contains(gc) {
            B += 1
        }
    }
    return "\(A)A\(B)B"
}

func substring(str:String, start:Int, len:Int) -> String {
    let sindex = str.index(str.startIndex, offsetBy: start)
    let eindex = str.index(str.startIndex, offsetBy: start + len)
    let range = sindex..<eindex
    
    return str.substring(with: range)
}

let answer = createAnswer(n:3)
print(answer)

var isWinner = false
for i in 1...10 {
    print("Guess a num : ", terminator:"")
    let guess:String? = readLine()
    let result = checkAB(answer: answer, guess: guess!)
    print("\(i). \(guess!) => \(result)")
    if result == "3A0B" {
        isWinner = true
        break
    }
}
if isWinner {
    print("WINNER")
}else {
    print("Losser: \(answer)")
}

print("Game Over")






