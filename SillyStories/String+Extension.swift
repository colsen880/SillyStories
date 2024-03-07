//
//  String+Extension.swift
//  SillyStories
//
//  Created by Chad Olsen on 2/27/24.
//

import Foundation


extension String {
    func scanForKeywords(keywords: [String]) -> [String] {
        guard keywords.count > 0 else {
            return []
        }
        var returnList: [String] = []
        for characterIndex in 0...self.count-1 {
            for keyword in keywords {
                let endNumber = characterIndex + keyword.count
                if endNumber < self.count {
                    let startIndex = self.index(self.startIndex, offsetBy: characterIndex)
                    let endIndex = self.index(self.startIndex, offsetBy:endNumber)
                    let scannedWord = self[startIndex..<endIndex]
                    if scannedWord == keyword {
                        returnList.append(keyword)
                    }
                }
                
            }
        }
        return returnList
    }
}

