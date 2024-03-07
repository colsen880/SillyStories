//
//  Word.swift
//  SillyStories
//
//  Created by Chad Olsen on 2/26/24.
//

import Foundation
enum WordType: String, CaseIterable {
    case unknown = ""
    case noun = "Noun"
    case verb = "Verb"
    case adverb = "Adverb"
    case adjective = "Adjective"
    case place = "Place"
    case pluralNoun = "Plural Noun"
    case pluralProfession = "Plural Profession"
    case maleCeleberty = "Male Celeberty"
    case femaleCeleberty = "Female Celeberty"
}

struct Word: Hashable, Identifiable {
    let id = UUID()
    var word: String
    var type: WordType
    
    init(word: String, type: WordType) {
        self.word = word
        self.type = type
    }
}
