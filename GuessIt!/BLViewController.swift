


import UIKit

class BLViewController: UIViewController {
    
    var CorrectAnswer = String()
    var score : Int = 0
    
    let questions = ["What brands logo is this?", "Whats the name of this brand?", "What brands logo is this?", " "]
    
    let images = [#imageLiteral(resourceName: "LouisVuitton copy-1"), #imageLiteral(resourceName: "Chanel"), #imageLiteral(resourceName: "Tommyhilfigure-2"), #imageLiteral(resourceName: "Background")]
    
    // first must be right answer
    let answers = [["Louis Vuitton", "Tiffany & Co", "Prada", "Calvin Klein"], ["Chanel", "Converse", "Gucci", "Guess"], ["Tommy Hilfigure", "Supreme", "Diesel", "Ralph Lauren"], [" ", " ", " ", " "]]
    
    let hints = ["I sell bags with my logo all over them", "I sell perfume", "I sell mens and womens clothing"]
    
    var CurrentQuestion = 0
    var CurrentHint = 0
    var currentImage = 0
    var RightAnswerPlace:UInt32 = 0

    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var QImage: UIImageView!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBAction func MultipleButtons(_ sender: AnyObject) {
        
        
        if (sender.tag == Int(RightAnswerPlace))
        {
            do{
                score += 1
                ScoreLabel.text = "Score:    \(score)"
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
        if (CurrentQuestion == questions.count)
        {
            button4.isHidden = true
            button3.isHidden = true
            button2.isHidden = true
            button1.isHidden = true
            nextgame.isHidden = false
        }
    }
    
    
    
    func NewQuestion()
    {
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
    
    @IBAction func HintButton(_ sender: Any) {
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

    @IBOutlet weak var nextgame: UILabel!
  
        
    @IBAction func Back(_ sender: AnyObject) {
        SecondViewController()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        
        nextgame.isHidden = true
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
