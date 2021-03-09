//
//  CreationViewController.swift
//  Flashcard
//
//  Created by Taohid Shadat on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {

    @IBOutlet var questionTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    
    @IBOutlet var Answer2: UITextField!
    @IBOutlet var Answer1: UITextField!
    
    var flashcardsController: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated:true)
    }
    
 
    @IBAction func done(_ sender: Any) {
        
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let answer1Text = Answer1.text
        let answer2Text = Answer2.text
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty){
           //creates alert box message
            let alert = UIAlertController(title:"Missing Text" , message: "You need to enter both a question and an answer", preferredStyle: .alert)
            //creates the okay button for box
            let okAction = UIAlertAction(title: "Ok", style: .default)
            //adds the button to alert box
            alert.addAction(okAction)
            //alert box pops up
            present(alert, animated: true)
        }else{
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, answer1: answer1Text!, answer2: answer2Text!)
            dismiss(animated: true)
        }
        
        
    }
    
}
