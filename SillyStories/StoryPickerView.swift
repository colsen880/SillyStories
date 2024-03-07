//
//  ContentView.swift
//  SillyStories
//
//  Created by Chad Olsen on 2/26/24.
//

import SwiftUI

struct StoryPickerView: View {
    
    @State var stories: [Story] = MockData.stories
    @State var selectedStory: Story?
    @State var isShowingWordEntry = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(stories) { story in
                    NavigationLink(value: story) {
                        StoryPickerCell(title: story.title, description: story.description)
                    }
                }
            }
            .navigationTitle("Available Stories")
            .navigationDestination(for: Story.self) { story in
                WordEntryView(story: story)
            }
            .background(.blue)
        }
       
    }
}

#Preview {
    StoryPickerView()
}

struct StoryPickerCell: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
                .font(.title2)
                .padding([.leading, .trailing, .bottom])
            Text(description)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
                
            Spacer()
        }
        
    }
        
}
