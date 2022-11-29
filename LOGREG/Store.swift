//
//  Store.swift
//  LOGREG
//
//  Created by macbook on 25/11/22.
//

import Foundation
import CoreData
import UIKit

class Store{
    
    public var login = [LOGREG]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func getDetails(){
        do{
            login = try context.fetch(LOGREG.fetchRequest())
            print(login)
        }
        catch{

        }
    }

    func create(name: String, email: String, phno: String){
        let newitem = LOGREG(context: context)
        newitem.email = email
        newitem.phno = phno
        newitem.name = name
        do{
            try context.save()
            getDetails()
            }
        catch{

        }

    }
    func deleteItem(item: LOGREG){
        context.delete(item)
        do{
            try context.save()
            getDetails()
        }
        catch{}
        
    }
    func updateItem(item: LOGREG , newname: String){
            
            item.name = newname
                        do{
                try context.save()
                getDetails()
            }
            catch{}
        
        }
    
    

    
}
