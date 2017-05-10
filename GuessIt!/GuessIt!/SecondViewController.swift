



import UIKit

class SecondViewController: UIViewController {
    
    
    @IBAction func ColoursShapesButton(_ sender: AnyObject) {
        
    CSViewController()
        
    }
    
    @IBAction func TVButton(_ sender: AnyObject) {
        
     TCViewController()
    }
    
    
    @IBAction func BrandButton(_ sender: AnyObject) {
        
     BLViewController()
        
    }
    
    
    
    @IBAction func BackButton(_ sender: AnyObject) {
        
        ViewController()
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
