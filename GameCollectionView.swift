//
//  GameCollectionView.swift
//  Project1
//
//  Created by Ted Nesham on 9/12/20.
//

import UIKit

class GameCollectionView: UICollectionViewController {

    var model = CardModel()                 // model for generating the cards.
    var cards = [Card]()                    // card data source.
    var firstFlipedIndex: IndexPath?        // Used to keep track of the first flipped card.

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cards = model.getCards()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    // swiftlint:disable line_length
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardGameCell else {
            print("error initializeing cells...")
            return UICollectionViewCell()
        }

        let card = cards[indexPath.row]
        cell.setCard(card)

        return cell
    }
    // swiftlint:enable line_length

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        // swiftlint:disable force_cast
        let cell = collectionView.cellForItem(at: indexPath) as! CardGameCell
        // swiftlint:enable force_cast

        let selectedCard = cards[indexPath.row]

        if !selectedCard.isFlipped && !selectedCard.isMatched {
            cell.flip()
            selectedCard.isFlipped = true

            if firstFlipedIndex == nil {
                firstFlipedIndex = indexPath
            } else {
                collectionView.allowsSelection = false
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                    collectionView.allowsSelection = true
                })
                checkMatch(indexPath)
            }
        }
    }

    func checkMatch(_ secondCardIndex: IndexPath) {
        let firstCardCell = collectionView.cellForItem(at: firstFlipedIndex!) as? CardGameCell
        let secondCardCell = collectionView.cellForItem(at: secondCardIndex) as? CardGameCell
        let actualCardOne = cards[firstFlipedIndex!.row]
        let actualCardTwo = cards[secondCardIndex.row]

        if actualCardOne.emoji == actualCardTwo.emoji {
            actualCardOne.isMatched = true
            actualCardTwo.isMatched = true
            firstCardCell?.remove()
            secondCardCell?.remove()

            if gameOver() {
                let alertCtrl = UIAlertController(title: "Congratulations You WIN!",
                                                  message: "Would you like to play again?",
                                                  preferredStyle: .alert)

                let action = UIAlertAction(title: "Play Again", style: .default, handler: { _ in
                    self.cards = self.model.getCards()
                    self.collectionView.reloadData()
                })

                alertCtrl.addAction(action)
                self.present(alertCtrl, animated: true )
            }

        } else {
            actualCardOne.isFlipped = false
            actualCardTwo.isFlipped = false
            firstCardCell?.flipBack()
            secondCardCell?.flipBack()
        }

        firstFlipedIndex = nil
    }

    func gameOver() -> Bool {
        for card in cards {
            if card.isMatched {
                continue
            } else {
                return false
            }
        }
        return true
    }
}
