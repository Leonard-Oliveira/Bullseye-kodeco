//
//  Game.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 16/12/22.
//

import Foundation

struct LeaderboardEntry {
  let points: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score  = 0
  var round  = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...109)
    addToLeaderboard(point: points)
  }
  
  mutating func restart() {
    score = 0
    round =  1
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard (point: Int) {
    leaderboardEntries.append(LeaderboardEntry.init(points: point, date: Date()))
    leaderboardEntries.sort { $0.points > $1.points }
  }
}
