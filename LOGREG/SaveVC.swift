//
//  SaveVC.swift
//  LOGREG
//
//  Created by macbook on 25/11/22.
//

import UIKit
import CoreData

protocol EditData{
    func updateData()
}

class SaveVC: UIViewController {
    
    public var login = [LOGREG]()
    var bank = Store()

//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var Name: UITextField!
    var delegate:EditData?
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phno: UITextField!

    override func viewDidLoad() {
        bank.getDetails()
    
        super.viewDidLoad()

    }
    @IBAction func Savebtn(_ sender: Any) {
        let nname = Name.text!
        let eemail = email.text!
        let pphno = phno.text!
        self.bank.create(name: nname, email: eemail, phno: pphno)
        delegate?.updateData()
        
    }
    
}

