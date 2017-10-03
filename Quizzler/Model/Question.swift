//
//  Question.swift
//  Quizzler
//
//  Created by Michael Jay Abalos on 03/10/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import Foundation

class Question {
    
    let question: String!
    let answer: Bool!
    
    init(text: String, correctAnswer: Bool) {
        question = text
        answer = correctAnswer
    }
}
