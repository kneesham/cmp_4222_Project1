//  ViewController.swift
//  Project1
//  Created by Ted Nesham on 9/12/20.

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentGameBoard()
    }

    func presentGameBoard() {
        let gameStoryBoard = UIStoryboard(name: "Game", bundle: nil)
        guard let gameController = gameStoryBoard.instantiateInitialViewController() as? GameCollectionView else {
            return
        }

        gameController.willMove(toParent: self)
        addChild(gameController)
        view.addSubview(gameController.view)
        gameController.didMove(toParent: self)

    }
}
