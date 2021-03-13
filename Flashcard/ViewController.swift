//
//  ViewController.swift
//  Flashcard
//
//  Created by Taohid Shadat on 2/20/21.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
}

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
    
    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var prevButton: UIButton!
    
    
    
    @IBAction func didTapNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateNextPrevButtons()
        updateLabels()
    }
    @IBAction func didTapPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateNextPrevButtons()
        updateLabels()
       
    }
    //array to hold our flashcards
    var flashcards = [Flashcard]()
    //current flashcard index
    var currentIndex = 0
    
    
    
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
        
        readSavedFlashcards()
        
        if (flashcards.count == 0){
            updateFlashcard(question: "Who is the CEO of Tesla?", answer: "Elon Musk", answer1: "Jeff Bezos", answer2: "Bill Gates")
        // Do any additional setup after loading the view.
        }else{
            updateLabels()
            updateNextPrevButtons()
        }
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
        let flashcard = Flashcard(question: question, answer: answer)
        Btn1.setTitle(answer1, for: .normal)
        Btn2.setTitle(answer, for: .normal)
        Btn3.setTitle(answer2, for: .normal)
        
        //adding flashcard in the flashcard array
        flashcards.append(flashcard)
        
        //update current index
        currentIndex = flashcards.count - 1
        print("Added new FlashCard")
        
        //update Buttons
        updateNextPrevButtons()
        
        //update labels
        updateLabels()
        
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        
        if (currentIndex == flashcards.count - 1){
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        if (currentIndex == 0){
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    func saveAllFlashcardsToDisk(){
        
        //flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return["question": card.question, "answer": card.answer]
        }
        //save array to disk
        UserDefaults.standard.setValue(dictionaryArray, forKey: "flashcards")
    }
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
            
        }
        
    }
}

    

