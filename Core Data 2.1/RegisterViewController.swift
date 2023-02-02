//
//  RegisterViewController.swift
//  Core Data 2.1
//
//  Created by AKHIL N P on 01/02/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var btnRef: UIButton!
    
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        //btnRef.cornerRad()
        
    }
    
    @IBAction func btnAct(_ sender: Any) {
        
        let  credentials = NSEntityDescription.insertNewObject(forEntityName: "Pin", into: context)
        
        credentials.setValue(self.emailTf.text, forKey: "email")
        credentials.setValue(self.passwordTf.text, forKey: "password")
        credentials.setValue(self.nameTf.text, forKey: "name")
        
        
        do
        {
            try context.save()
            self.emailTf.text = ""
            self.passwordTf.text = ""
            self.nameTf.text = ""
            
            
        }
        catch
        {
            print("error")
        }
    }
    
    @IBAction func recordView(_ sender: Any) {
        let strybrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = strybrd.instantiateViewController(withIdentifier: "record")as!RecordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
