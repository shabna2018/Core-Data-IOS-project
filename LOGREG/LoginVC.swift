//
//  LoginVC.swift
//  LOGREG
//
//  Created by macbook on 25/11/22.
//

import UIKit
import CoreData

class LoginVC: UIViewController {
    public var login = [LOGREG]()
    var bank = Store()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var NAME: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func Loginbtn(_ sender: Any) {
        
        if NAME.text == ""
            {
                let alert = UIAlertController(title: "Alert", message: "Please enter the Name", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                 alert.addAction(ok)
               self.present(alert, animated: true, completion: nil)
            }
            else
            {self.Valid(name : NAME.text! as String)}
    }
    func Valid(name: String)
    {do{
            let login = try context.fetch(LOGREG.fetchRequest())
            for data in login as! [LOGREG] {

            let Data = data.value(forKey: "name") as! String
      if name == Data{
            let alert = UIAlertController(title: "Message", message: "Success login", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
           alert.addAction(ok)
          self.present(alert, animated: true, completion: nil)
            print("success")
      }else{
          let alert = UIAlertController(title: "Message", message: "Invalid login", preferredStyle: .alert)
          let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
         alert.addAction(ok)
          self.present(alert, animated: true, completion: nil)      }
    }
    }catch {
        
        
               }
           }
    
}
