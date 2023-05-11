        //
        //  ViewController.swift
        //  Coredataexample
        //
        //  Created by apple on 21/11/22.
        //

        import UIKit
        import CoreData
        class ViewController: UIViewController {
           
            @IBOutlet var txt1:UITextField!
            @IBOutlet var txt2:UITextField!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                       
            }
            
            @IBAction func btnclick(sender:Any)
            {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
               
                 let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
                 let newStudent = NSManagedObject(entity: entity!, insertInto: context)
                newStudent.setValue(txt1.text, forKey: "name")
                newStudent.setValue(txt2.text, forKey: "rno")
                   
                 do{
                     try context.save()
                 //  fetchData()
                 }catch{
                     debugPrint("Can't save")
                 }
                
            }
            
                


        }


