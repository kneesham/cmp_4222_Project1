//
//  CardModel.swift
//  Project1
//
//  Created by Ted Nesham on 9/14/20.
//

import Foundation

class CardModel {
    let emojis = ["💃🏼", "🕺🏻", "🐶", "🌻", "😍", "🇺🇸", "🎁", "⏰", "📱",
                  "🌄", "🗿", "🚁", "🛸", "🎻", "🎭", "🤾‍♂️", "🎱", "🥂", "💻"]

    func getCards() -> [Card] {

        var generatedCardArray = [Card]()

        for index in 1...18 {

            let firstCard = Card()
            let secondtCard = Card()

            firstCard.emoji = emojis[index - 1]
            secondtCard.emoji = emojis[index - 1]

            generatedCardArray.append(firstCard)
            generatedCardArray.append(secondtCard)

        }
        return generatedCardArray.shuffled()
    }
}
