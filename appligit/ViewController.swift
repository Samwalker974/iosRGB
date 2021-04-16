//
//  ViewController.swift
//  appligit
//
//  Created by SamuelS on 16/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Definition des Labels Rouge,Vert et Bleu
    @IBOutlet weak var redAff: UILabel!
    @IBOutlet weak var greenAff: UILabel!
    @IBOutlet weak var blueAff: UILabel!
    
    //Definition des Slide Rouge,Vert et Bleu
    @IBOutlet weak var slideAffRed: UISlider!
    @IBOutlet weak var slideAffGreen: UISlider!
    @IBOutlet weak var slideAffBlue: UISlider!
    
    //Definition des Texte Colorer  Rouge,Vert et Bleu
    @IBOutlet weak var premAff: UITextField!
    @IBOutlet weak var precAff: UITextField!
    @IBOutlet weak var penulAff: UITextField!
    
    //Un entier qui sera utiliser lorsque l'utilisateur appuye sur Enregistre
    var countEnregistrer = 0
    
    //Les couleurs en Hexa forme FF FF FF (Rappel)
    var hexaRed = "FF"
    var hexaBlue = "FF"
    var hexaGreen = "FF"
    
    //Les Couleur en Mode CGFLoat pour pouvoir etre transcrit pour le background de chaque Texte Colorer
    var flotRedPrem = CGFloat(0.0)
    var flotBluePrem = CGFloat(0.0)
    var flotGreenPrem = CGFloat(0.0)
    
    //Les couleur en Hexa pour les Texte Colorer forme FFFFFF
    var couleurChoisi = "FFFFFF"
    var couleurPrecent = ""
    var couleurPenul = ""
    
    //Creation d'une Classe servant a definir pour Penu et Prec
    class colorCho {
        var floRed = CGFloat(0.0)
        var floGreen = CGFloat(0.0)
        var floBlue = CGFloat(0.0)
        //Rappel le text color est en UIcolor
        var textColor = UIColor()
    }
    
    //Definition des variables et affectation de la classe
    var colorPrec = colorCho()
    var colorPenu = colorCho()
    
    //Variable servant a stocker la couleur du Texte du Premier
    var textColorPrem = UIColor()
    
    //VAriable pour le button web
    var webBool = false
    
    //Function de base
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Le Slide Rouge
    @IBAction func redSlide(_ sender: UISlider) {
        //Affectation a une variable local la valeur
        var valeur = Int(sender.value)
        //Avancer de 10 si web est Active
        let step = Float(10)
        if webBool == true {
            //Arondi du float selon le step et affectation dans valuer
            let valeurRound = round(sender.value/step)*step
            sender.value = valeurRound
            valeur = Int(valeurRound)
        }
        //Affichage dans le label rouge en pourcentage
        redAff.text = "Rouge : \(valeur)%"
        //Nouvelle variable servant ici a obtenir un poucentage comparrer au max 255 (couleur)
        let newValeur = Int(255*valeur/100)
        //Affectation du pourcentage pour afficher dans la couleur ici le rouge
        flotRedPrem = CGFloat(Float(valeur)/100.0)
        hexaRed = strCouleur(valeur: newValeur)
        //Affectation de la couleur prem choisi
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        //Affichage du text choisi
        premAff.text = couleurChoisi
        //Affichage du background comparer a la couleur
        premAff.backgroundColor = UIColor(red: flotRedPrem, green: flotGreenPrem, blue: flotBluePrem, alpha: 1)
        //Function servant a mettre en noir ou blanc le text choisi selon la couleur du background
        ligthTextColor()
        
    }
    //Slide Vert meme que le Slide Rouge
    @IBAction func greenSlide(_ sender: UISlider) {
        var valeur = Int(sender.value)
        //Avancer de 10 si web est Active
        let step = Float(10)
        if webBool == true {
            //Arondi du float selon le step et affectation dans valuer
            let valeurRound = round(sender.value/step)*step
            sender.value = valeurRound
            valeur = Int(valeurRound)
        }
        greenAff.text = "Vert : \(valeur)%"
        let newValeur = Int(255*valeur/100)
        flotGreenPrem = CGFloat(Float(valeur)/100.0)
        hexaGreen = strCouleur(valeur: newValeur)
        
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        premAff.text = couleurChoisi
        
        premAff.backgroundColor = UIColor(red: flotRedPrem, green: flotGreenPrem, blue: flotBluePrem, alpha: 1)
        ligthTextColor()
        
        
    }
    //Slide Bleue meme que le Slide Rouge
    @IBAction func blueSlide(_ sender: UISlider) {
        var valeur = Int(sender.value)
        //Avancer de 10 si web est Active
        let step = Float(10)
        if webBool == true {
            //Arondi du float selon le step et affectation dans valuer
            let valeurRound = round(sender.value/step)*step
            sender.value = valeurRound
            valeur = Int(valeurRound)
        }
        blueAff.text = "Bleu : \(valeur)%"
        
        let newValeur = Int(255*valeur/100)
        flotBluePrem = CGFloat(Float(valeur)/100.0)
        hexaBlue = strCouleur(valeur: newValeur)
        
        couleurChoisi = "#"+hexaRed+hexaGreen+hexaBlue
        premAff.text = couleurChoisi
        premAff.backgroundColor = UIColor(red: flotRedPrem, green: flotGreenPrem, blue: flotBluePrem, alpha: 1)
        ligthTextColor()
    }
    //Button Raz servant a mettre les slide au millieu
    @IBAction func razButton(_ sender: UIButton) {
        //Affectation des valeurs au Slide
        slideAffRed.setValue(Float(50), animated: true)
        slideAffBlue.setValue(Float(50), animated: true)
        slideAffGreen.setValue(Float(50), animated: true)
        //Affectation de leur Label associé
        blueAff.text = "Bleu : 50%"
        greenAff.text = "Vert : 50%"
        redAff.text = "Rouge : 50%"
        //Affichage du Texte Prem
        couleurChoisi = "#323232"
        premAff.text = couleurChoisi
        //Affichage pour la background
        flotBluePrem = CGFloat(50.0/100.0)
        flotRedPrem = CGFloat(50.0/100.0)
        flotGreenPrem = CGFloat(50.0/100.0)
        premAff.backgroundColor = UIColor(red: flotRedPrem, green: flotGreenPrem, blue: flotBluePrem, alpha: 1)
        ligthTextColor()
        
    }
    
    //Function donnant la valeur en Hexa pour la valeur demander
    func strCouleur(valeur : Int) -> String {
        var st = "00"
        //ici if 17 pour rajouter un zero au 16 premier element (exemple: 02)
        if valeur < 17{
            st = "0"+String(valeur,radix: 16)
        }
        else{
            st = String(valeur,radix: 16)
        }
        return st
    }
    //Function de la Couleur du Tetet correspondant au Background
    func ligthTextColor() -> Void {
        //Selon les donner affecter au slide on dit Blanc ou Noir
        if flotRedPrem < 0.6 || flotBluePrem < 0.5 && flotGreenPrem < 0.4{
            //Affectation dans le Texte Prem la couleur Blanche
            textColorPrem = UIColor.white
            //Affichage dans Prem
            premAff.textColor = UIColor.white
        }else{
            //Affectation dans le Texte Prem la couleur Noire
            textColorPrem = UIColor.black
            //Affichage dans Prem
            premAff.textColor = UIColor.black
        }
    }
    
    //Button enregistrer la couleur
    @IBAction func enregistrer(_ sender: UIButton) {
        //Ingremneation de la valleur a chaque fois que la func est appellé
        countEnregistrer += 1
        //Pour la premier seulement on doit enregistrer dans Precedent seulement
        if countEnregistrer == 1 {
            updatePrec()
            precAff.text = couleurPrecent
        }
        //Ici on met a jour Penu et Prec
        else{
            //penu avant pour ne pas perde la donner de Precedent
            updatePenu()
            updatePrec()
            //Affichage dans l'Application des Texte
            precAff.text = couleurPrecent
            penulAff.text = couleurPenul
        }
        
        
    }
    //update de Precedent
    func updatePrec() -> Void {
        //Couleur precedent est obtenue grace a la couleur choisi de Base
        couleurPrecent = couleurChoisi
        //Grace a la classe couleurCho defini on affecte les couleur
        colorPrec.floBlue = flotBluePrem
        colorPrec.floRed = flotRedPrem
        colorPrec.floGreen = flotGreenPrem
        colorPrec.textColor = textColorPrem
        //Affectation du background couleur et du texte selon la couleur prem
        precAff.backgroundColor = UIColor(red: colorPrec.floRed, green: colorPrec.floGreen, blue: colorPrec.floBlue, alpha: 1)
        precAff.textColor = colorPrec.textColor
        
    }
    //update de Penu
    func updatePenu() -> Void {
        //Couleur penul est obtenue grace a la couleur precedent
        couleurPenul = couleurPrecent
        //Affectation grace a la classe couleurCho
        colorPenu.floBlue = colorPrec.floBlue
        colorPenu.floRed = colorPrec.floRed
        colorPenu.floGreen = colorPrec.floGreen
        colorPenu.textColor = colorPrec.textColor
        //Affichage de la couleur associe et du texte selon la couleur de precedent
        penulAff.backgroundColor = UIColor(red: colorPenu.floRed, green: colorPenu.floGreen, blue: colorPenu.floBlue, alpha: 1)
        penulAff.textColor = colorPenu.textColor
    }
    
    //Button web definir quand l'utilisateur actives
    @IBAction func webChange(_ sender: UISwitch) {
        webBool = sender.isOn
        
        
    }
    
    
}

