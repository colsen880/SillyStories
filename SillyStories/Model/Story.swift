//
//  Story.swift
//  SillyStories
//
//  Created by Chad Olsen on 2/26/24.
//

import SwiftUI

struct Story: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let description: String
    
    init(title: String, text: String, description: String) {
        self.title = title
        self.text = text
        self.description = description
    }
    
    func getReplacementWords() -> [Word] {
        var words: [Word] = []
        let keywords = WordType.allCases.map({ "<\($0.rawValue)>" })
        let instances = text.scanForKeywords(keywords: keywords)
        
        for instance in instances {
            switch instance {
            case "<\(WordType.noun.rawValue)>":
                words.append(Word(word: "", type: .noun))
            case "<\(WordType.verb.rawValue)>":
                words.append(Word(word: "", type: .verb))
            case "<\(WordType.adverb.rawValue)>":
                words.append(Word(word: "", type: .adverb))
            case "<\(WordType.adjective.rawValue)>":
                words.append(Word(word: "", type: .adjective))
            case "<\(WordType.maleCeleberty.rawValue)>":
                words.append(Word(word: "", type: .maleCeleberty))
            case "<\(WordType.femaleCeleberty.rawValue)>":
                words.append(Word(word: "", type: .femaleCeleberty))
            case "<\(WordType.pluralNoun.rawValue)>":
                words.append(Word(word: "", type: .pluralNoun))
            case "<\(WordType.place.rawValue)>":
                words.append(Word(word: "", type: .place))
            case "<\(WordType.pluralProfession.rawValue)>":
                words.append(Word(word: "", type: .pluralProfession))

            default:
                print("Unknown Instance: \(instance)")
                words.append(Word(word: "", type: .unknown))
            }
        }
        
        return words
    }
    
    func replaceWords(words:[Word]) -> String {
        var wordsReplaced = self.text
        
        for word in words {
            guard let range = wordsReplaced.range(of: "<\(word.type.rawValue)>") else {
                return ""
            }
            wordsReplaced = wordsReplaced.replacingCharacters(in: range, with: word.word)
        }
        return wordsReplaced
    }
}
