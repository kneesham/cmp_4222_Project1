
//  ViewController.swift
//  Project1
//  Created by Ted Nesham on 9/12/20.

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        presentLoginViewController()
        presentGameBoard()
    }
    
    func presentLoginViewController() {
        // display login view controller.
        let loginStoryBoard = UIStoryboard(name: "Login", bundle: nil)
        guard let loginController = loginStoryBoard.instantiateInitialViewController() as? LoginViewController else {
            return
        }
        
        loginController.willMove(toParent: self)
        addChild(loginController)
        view.addSubview(loginController.view)
        loginController.didMove(toParent: self)
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
        
        // TODO: implement the game board view ...
    }

}

