//
//  ViewController.swift
//  Flashcard
//
//  Created by Taohid Shadat on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //destination of segue is Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //Navigation Controller only contains creation view controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //we set the flashcardsController property to self
        creationController.flashcardsController = self
    }
    
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //give it round corners
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        //give it shadows
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        //border style for buttons
        Btn3.layer.borderWidth = 3.0
        Btn3.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        Btn3.layer.cornerRadius = 10.0
        
        Btn2.layer.borderWidth = 3.0
        Btn2.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        Btn2.layer.cornerRadius = 10.0
        
        Btn1.layer.borderWidth = 3.0
        Btn1.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        Btn1.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
    }
  
    
    
    @IBAction func didTapButton(_ sender: Any) {
        if (frontLabel.isHidden == true){
            frontLabel.isHidden = false
        } else{
            frontLabel.isHidden = true
        }
    }
    
    @IBAction func didTap1(_ sender: Any) {
        Btn1.isHidden = true
    }
    
    @IBAction func didTap2(_ sender: Any) {
        if (frontLabel.isHidden == true){
            frontLabel.isHidden = false
            Btn2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            Btn1.isHidden = false
            Btn3.isHidden = false
        } else{
            frontLabel.isHidden = true
            Btn2.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
    }
    
    @IBAction func didTap3(_ sender: Any) {
        Btn3.isHidden = true
    }
    
    func updateFlashcard(question: String, answer: String, answer1: String?, answer2: String?){
        frontLabel.text = question
        backLabel.text = answer
        Btn1.setTitle(answer1, for: .normal)
        Btn2.setTitle(answer, for: .normal)
        Btn3.setTitle(answer2, for: .normal)
    }
    
    
}
    

