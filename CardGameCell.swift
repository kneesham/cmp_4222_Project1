//
//  CardGameCell.swift
//  Project1
//
//  Created by Ted Nesham on 9/13/20.
//

import UIKit
import AVFoundation

class CardGameCell: UICollectionViewCell {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!

    var card: Card?

    func setCard(_ card: Card) {

        self.layer.cornerRadius = 10
        self.card = card
        frontLabel.text = card.emoji
        backLabel.text = "⁇"

        if card.isFlipped {
            UIView.transition(from: backLabel, to: frontLabel, duration: 0,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion: nil)
        } else {
            UIView.transition(from: frontLabel, to: backLabel, duration: 0,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
    }

    func flip() {
        AudioServicesPlaySystemSound(1104)
        UIView.transition(from: backLabel, to: frontLabel, duration: 0.3,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
    }

    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            AudioServicesPlaySystemSound(1057)
            UIView.transition(from: self.frontLabel, to: self.backLabel, duration: 0.3,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        })
    }

    func remove() {
        UIView.animate(withDuration: 0.2, delay: 0.5, options: .transitionCrossDissolve, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}
