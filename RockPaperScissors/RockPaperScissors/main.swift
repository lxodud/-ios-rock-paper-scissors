//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum HandType: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func getUserNumberWithValidation() -> Int? {
    guard let input = readLine(),
          let userNumber = Int(input),
          userNumber >= 0,
          userNumber <= 3
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    return userNumber
}

func compareHands(userHand: HandType, computerHand: HandType) {
    if userHand == computerHand {
        print("비겼습니다!")
        playRockScissorPaper()
        return
    } else if userHand == .scissor && computerHand == .paper {
        print("이겼습니다!")
        return
    } else if userHand == .paper && computerHand == .scissor {
        print("졌습니다!")
        return
    }
    
    if userHand.rawValue > computerHand.rawValue {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func playRockScissorPaper() {
    printRockScissorPaper()
    guard let userNumber = getUserNumberWithValidation() else {
        playRockScissorPaper()
        return
    }
    guard let userHand = HandType(rawValue: userNumber) else {
        print("게임 종료")
        return
    }
    guard let computerHand = HandType(rawValue: Int.random(in: 1...3)) else { return }
    compareHands(userHand: userHand, computerHand: computerHand)
}

playRockScissorPaper()
