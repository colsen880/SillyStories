//
//  StoryView.swift
//  SillyStories
//
//  Created by Chad Olsen on 3/6/24.
//

import SwiftUI

struct StoryView: View {
    
    @State var storyText: String
    @State var title: String
    
    var body: some View {
        VStack {
            Text(storyText)
                .font(.title3)
                .padding([.leading, .trailing, .bottom])
            Spacer()
        }
        .navigationTitle(title)
    }
}

#Preview {
    StoryView(storyText: MockData.stories[0].text, title: MockData.stories[0].title)
}
