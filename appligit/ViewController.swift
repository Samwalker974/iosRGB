//
//  ViewController.swift
//  appligit
//
//  Created by SamuelS on 16/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redAff: UILabel!
    @IBOutlet weak var greenAff: UILabel!
    @IBOutlet weak var blueAff: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redSlide(_ sender: UISlider) {
        redAff.text = "Rouge : \(Int(sender.value))%"
    }
    @IBAction func greenSlide(_ sender: UISlider) {
        greenAff.text = "Vert : \(Int(sender.value))%"
    }
    @IBAction func blueSlide(_ sender: UISlider) {
        blueAff.text = "Bleu : \(Int(sender.value))%"
    }
    
    
}

