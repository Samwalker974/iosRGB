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
    
    
    @IBOutlet weak var slideAffRed: UISlider!
    @IBOutlet weak var slideAffGreen: UISlider!
    @IBOutlet weak var slideAffBlue: UISlider!
    
    @IBOutlet weak var premAff: UITextField!
    
    
    var hexaRed = "FF"
    var hexaBlue = "FF"
    var hexaGreen = "FF"
    
    var intRed = CGFloat(0.0)
    var intBlue = CGFloat(0.0)
    var intGreen = CGFloat(0.0)
    
    var couleurChoisi = "FFFFFF"
    var couleurPrecent = ""
    var couleurPenul = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redSlide(_ sender: UISlider) {
        let valeur = Int(sender.value)
        redAff.text = "Rouge : \(valeur)%"
        
        let newValeur = Int(255*valeur/100)
        intRed = CGFloat(Float(valeur)/100.0)
        hexaRed = strCouleur(valeur: newValeur)
        
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        premAff.text = couleurChoisi
        premAff.backgroundColor = UIColor(red: intRed, green: intGreen, blue: intBlue, alpha: 1)
        
        
        ligthTextColor()
        
    }
    @IBAction func greenSlide(_ sender: UISlider) {
        let valeur = Int(sender.value)
        greenAff.text = "Vert : \(valeur)%"
        let newValeur = Int(255*valeur/100)
        intGreen = CGFloat(Float(valeur)/100.0)
        hexaGreen = strCouleur(valeur: newValeur)
        
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        premAff.text = couleurChoisi
        
        premAff.backgroundColor = UIColor(red: intRed, green: intGreen, blue: intBlue, alpha: 1)
        ligthTextColor()
        
        
    }
    @IBAction func blueSlide(_ sender: UISlider) {
        let valeur = Int(sender.value)
        blueAff.text = "Bleu : \(valeur)%"
        
        let newValeur = Int(255*valeur/100)
        intBlue = CGFloat(Float(valeur)/100.0)
        hexaBlue = strCouleur(valeur: newValeur)
        
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        premAff.text = couleurChoisi
        premAff.backgroundColor = UIColor(red: intRed, green: intGreen, blue: intBlue, alpha: 1)
        ligthTextColor()
    }
    @IBAction func razButton(_ sender: UIButton) {
        slideAffRed.setValue(Float(50), animated: true)
        slideAffBlue.setValue(Float(50), animated: true)
        slideAffGreen.setValue(Float(50), animated: true)
        blueAff.text = "Bleu : 50%"
        greenAff.text = "Vert : 50%"
        redAff.text = "Rouge : 50%"
    }
    
    func strCouleur(valeur : Int) -> String {
        var st = "00"
        if valeur < 17{
            st = "0"+String(valeur,radix: 16)
        }
        else{
            st = String(valeur,radix: 16)
        }
        return st
    }
    
    func ligthTextColor() -> Void {
        if intRed < 0.6 || intBlue < 0.5 && intGreen < 0.4{
            premAff.textColor = UIColor.white
        }else{
            premAff.textColor = UIColor.black
        }
        
        

        
    }
    
    
}

