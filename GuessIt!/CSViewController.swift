

import UIKit

class CSViewController: UIViewController {
    
   
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var QImage: UIImageView!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    var CorrectAnswer = String()
    var score : Int = 0
    var GamePlay = true
    
    let questions = ["What shape is coloured in purple?", "Which one is red?", "how many colours are there?","Please click back and choose your next level"]
    
    let images = [#imageLiteral(resourceName: "shapes1"), #imageLiteral(resourceName: "shapes2"), #imageLiteral(resourceName: "shapes3 copy"), #imageLiteral(resourceName: "Logo")]
    
    // first must be right answer
    let answers = [["Square", "Triangle", "Heart", "Circle"], ["Heart", "Triangle", "Arrrow", "Circle"], ["3", "5", "2", "1"],[" ", " ", " ", " "]]
    
    let hints = ["Q1hint", "Q2hint", "Q3hint"]
    
    var CurrentQuestion = 0
    var CurrentHint = 0
    var currentImage = 0
    var RightAnswerPlace:UInt32 = 0

    
    
    
    @IBAction func MultipleButtons(_ sender: AnyObject) {
        
        
        if (sender.tag == Int(RightAnswerPlace))
        {
            do{
                score += 1
                ScoreLabel.text = "Score = \(score)"
            }
            
            do{
                let alertController = UIAlertController(title: "Correct Answer", message: "Click to go to next question", preferredStyle: .alert)
                alertController.view.tintColor = UIColor.green
                let yesAction = UIAlertAction(title: "Go", style: .default) {
                    (action) -> Void in print("correct")}
                alertController.addAction(yesAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
        else
        {
            do{
                let alertController = UIAlertController(title: "Wrong Answer", message: "Click to go to next question", preferredStyle: .alert)
                alertController.view.tintColor = UIColor.red
                let yesAction = UIAlertAction(title: "Go", style: .default) {
                    (action) -> Void in print("wrong")}
                alertController.addAction(yesAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
        
        if (CurrentQuestion != questions.count)
        {
            NewQuestion()
            
        }
        else
        {
            print("done")
    
        }
   
    }
    
    
    
    func NewQuestion()
    {
        GamePlay = true
        Question.text = questions[CurrentQuestion]
        
        QImage.image = images[currentImage]
        
        RightAnswerPlace = arc4random_uniform(4)+1
        
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(RightAnswerPlace))
            {
                button.setTitle(answers[CurrentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[CurrentQuestion][x], for: .normal)
                x += 1
                
            }
            
            
        }
        
        CurrentQuestion += 1
        currentImage += 1
        
 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NewQuestion()
        
    }
    
    
    
    @IBAction func HintButton(_ sender: AnyObject) {
        
        HINT()
    }
    
    
    
    func HINT()
    {
        
        let Qhint = hints[CurrentHint]
        
        
        
        if CurrentQuestion == 0
        {
            CurrentHint = 0
        }
        else if CurrentQuestion == 1
        {
            CurrentHint = 1
        }
        else if CurrentQuestion == 2
        {
            CurrentHint = 2
        }
        
        
        do{
            let alertController = UIAlertController(title: "Hint", message: " \(Qhint) ", preferredStyle: .alert)
            let backView = alertController.view.subviews.last?.subviews.last
            backView?.layer.cornerRadius = 10.0
            backView?.backgroundColor = UIColor.blue
            alertController.view.tintColor = UIColor.black
            let yesAction = UIAlertAction(title: "Okay", style: .default) {
                (action) -> Void in print("hint")}
            alertController.addAction(yesAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        CurrentHint += 1
        
    }
    

    @IBAction func BAckbutton(_ sender: AnyObject) {
        
        SecondViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
