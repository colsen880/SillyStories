//
//  StoryPickerCell.swift
//  SillyStories
//
//  Created by Chad Olsen on 3/7/24.
//

import SwiftUI

struct StoryPickerCell: View {
    var story: Story
    var body: some View {
        VStack {
            Text(story.title)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
                .font(.title2)
                .padding([.trailing, .bottom])
            Text(story.description)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
                
            Spacer()
        }
    }
}

#Preview {
    StoryPickerCell(story: MockData.stories[0])
}
