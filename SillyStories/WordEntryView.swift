//
//  WordEntryView.swift
//  SillyStories
//
//  Created by Chad Olsen on 2/26/24.
//

import SwiftUI

struct WordEntryView: View {
    //nouns, verbs, adjectives, and adverbs
//    var nounCount: Int = 0
//    var verbCount: Int = 0
//    var adjectiveCount: Int = 0
//    var adverbCount: Int = 0
//    
//    var adjectives: [String] = []
//    var nouns: [String] = []
//    var verbs: [String] = []
//    var adverbs: [String] = []
    @State var words: [Word] = []
    
    @State var story: Story
    
    var body: some View {
        VStack {
            Form() {
                ForEach($words) { $word in
                    TextField(word.type.rawValue, text: $word.word)
                }
            }
            if !words.contains(where: {$0.word == ""}) {
                
                NavigationLink(destination: {
                    StoryView(storyText: story.replaceWords(words: words), title: story.title)
                    
                }, label: {
                    Text("Continue To Story")
                })
            } else {
                Text("Please Fill Out The Form")
            }
            
            
            Spacer(minLength: 50)
        }
        .navigationTitle("Enter Some Words")
        .onAppear() {
            words = story.getReplacementWords()
        }
    }
    
    func continueToStory() {
        let completedStory = story.replaceWords(words: words)
        print(completedStory)
    }
}

#Preview {
    WordEntryView(story: MockData.stories[0])
}
