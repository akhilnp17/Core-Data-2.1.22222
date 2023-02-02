//
//  RecordViewController.swift
//  Core Data 2.1
//
//  Created by AKHIL N P on 01/02/23.
//

import UIKit
import CoreData

class RecordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var nameSearchTf: UITextField!
    @IBOutlet weak var recordTbl: UITableView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var nameUpdate: UITextField!
    
    
    @IBOutlet weak var emailUpdate: UITextField!
    
    
    @IBOutlet weak var passwordUpdate: UITextField!
    
    var record : [Pin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch1()
        recordTbl.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return record.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellone", for: indexPath)as!CellRecordTableViewCell
        let record1 = record[indexPath.row]
        cell.cellName.text = record1.name
        cell.cellEmail.text = record1.email
        cell.cellPass.text = record1.password
        return cell
    }
    
    func fetch1(){
        do{
            record = try context.fetch(Pin.fetchRequest())
        }
        catch{
            print("error")
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
        if editingStyle == .delete
        {
            let std = record[indexPath.row]
            context.delete(std)
            (UIApplication.shared.delegate as!AppDelegate).saveContext()
            
            do
            {
                record = try context.fetch(Pin.fetchRequest())
            }
            catch
            {
                print("error")
                
            }
        }
        recordTbl.reloadData()
    }
    
    @IBAction func searchName(_ sender: Any) {
       // var result : [Pin] = []
        var oneroll = ""
        let request = NSFetchRequest <NSFetchRequestResult>(entityName: "Pin")
                   let searchstring = self.nameSearchTf.text
                   
                   request.predicate = NSPredicate(format: "name == %@", searchstring!)
                   
                   var outputstr = ""
                   
                   do
                   {
                   let result = try context.fetch(request)
                   if result.count > 0
                   {
                       
                       for oneline in result
                       {
                               oneroll = (oneline as AnyObject).value(forKey: "name") as! String
                              let onename = (oneline as AnyObject).value(forKey: "email") as! String
                              let onemark = (oneline as AnyObject).value(forKey: "password") as! String




           outputstr += oneroll + " " + onename + " " + onemark + " "

                           nameUpdate.text = oneroll
                           emailUpdate.text = onename
                           passwordUpdate.text = onemark

                       }
                      
                       print(oneroll)
                      
                   }
                   
                   else
                   {
                       outputstr = "no match"
                       }
                       self.nameSearchTf.text = outputstr
                   
               }
               catch
               {
                   print("error")
                   }
        
           }

    
    @IBAction func updateBtn(_ sender: Any) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pin")
        fetchRequest.predicate = NSPredicate(format: "name == %@", nameUpdate.text!)

        do {
                       let results = try context.fetch(fetchRequest) as? [NSManagedObject]
                       if results?.count != 0 { // Atleast one was returned
                           results![0].setValue(nameUpdate.text, forKey: "name")
                           results![0].setValue(emailUpdate.text, forKey: "email")
                           results![0].setValue(passwordUpdate.text, forKey: "password")
                          
                           
                       }
                   } catch {
                       print("Fetch Failed: \(error)")
                   }
                   
                   do {
                       try context.save()
                      
                       nameUpdate.text = ""
                       emailUpdate.text = ""
                       passwordUpdate.text = ""
                       recordTbl.reloadData()
                   }
                   catch {
                       print("Saving Core Data Failed: \(error)")
                   }

    }
    
    
    
    }
    

