//
//  ViewController.swift
//  Flashcard
//
//  Created by Taohid Shadat on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapFlashcard(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
}

