//
//  ViewController.swift
//  UserDefaultsArrayStoryboard
//
//  Created by Daniel Moya on 8/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pnombre: UITextField!
    @IBOutlet weak var snombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myArray = UserDefaults.standard.stringArray(forKey: "array"){
            pnombre.text = myArray[0]
            snombre.text = myArray[1]
            apellidos.text = myArray[2]
        }
    }


    @IBAction func guardar(_ sender: UIButton) {
        
        if pnombre.text == "" || snombre.text == "" || apellidos.text == ""{
            alerta(titulo: "Error", mensaje: "Completa todos los campos")
            
        } else {
            array.append(pnombre.text ?? "")
            array.append(snombre.text ?? "")
            array.append(apellidos.text ?? "")
            UserDefaults.standard.set(array, forKey: "array")
            alerta(titulo: "Usuario guardado", mensaje: "")
            print("Saved")
        }
    }
    
    func alerta(titulo: String, mensaje: String) -> Void {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

