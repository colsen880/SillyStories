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
                        StoryPickerCell(story: story)
                    }
                }
            }
            .navigationTitle("Available Stories")
            .navigationDestination(for: Story.self) { story in
                WordEntryView(story: story)
            }
        }
    }
}

#Preview {
    StoryPickerView()
}

