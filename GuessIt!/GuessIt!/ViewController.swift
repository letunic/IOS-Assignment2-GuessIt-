//
//  ViewController.swift
//  GuessIt!
//
//  Created by Soul & Co on 8/5/17.
//  Copyright © 2017 DanielaLetunica. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
  
    
    
    
    //User Image
    @IBOutlet weak var Insert: UIImageView!
    
    
    //Insert User image
    @IBAction func InsertImageButton(_ sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
        if let image =  info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            Insert.image = image
            
        }
        else
        {
            Insert.image = nil
        }
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBOutlet var Nameinput: UITextField!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //Start Button
    
    @IBAction func StartButton(_ sender: AnyObject) {
        
        SecondViewController()
    }
    
    
    
    //Music
    
    
    @IBOutlet weak var MusicPlayer: UIButton!
    @IBAction func Musicplayer(_ sender: Any) {
        
        Play.isHidden = false
        Pause.isHidden = false
        Stop.isHidden = false
    }
    
   
    
    var soundplayer: AVAudioPlayer?
    var elapsedtime: TimeInterval = 0
    
    
    @IBAction func Play(_ sender: Any) {
        
        if soundplayer != nil {
            soundplayer!.currentTime = elapsedtime
            soundplayer!.play()
            
        }
    }
    
    
    
    @IBAction func Pause(_ sender: Any) {
        
        if soundplayer != nil {
            elapsedtime = soundplayer!.currentTime
            soundplayer!.pause()
        }
        
    }
    
    @IBAction func Stop(_ sender: Any) {
        
        if soundplayer != nil {
            soundplayer!.stop()
            elapsedtime = 0
        }
    }
    
    @IBOutlet weak var Play: UIButton!
    @IBOutlet weak var Pause: UIButton!
    @IBOutlet weak var Stop: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Play.isHidden = true
        Pause.isHidden = true
        Stop.isHidden = true
        
        let path =
            Bundle.main.path(forResource: "song", ofType: "mp3")// song sourced royalty free @ http://www.bensound.com/royalty-free-music/2
        let url = URL(fileURLWithPath: path!)
        
        do{
            try soundplayer = AVAudioPlayer(contentsOf: url)
        }
        catch
        {
            print("file not available")
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

