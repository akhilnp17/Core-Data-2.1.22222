//
//  ViewController.swift
//  Core Data 2.1
//
//  Created by AKHIL N P on 01/02/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var btns: UIButton!
    
    @IBOutlet weak var mailId: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // btns.cornerRad()

    }
    
    @IBAction func btnActn(_ sender: Any) {
        

        
    }
    
    @IBAction func registerHere(_ sender: Any) {
        
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "register")as!RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

