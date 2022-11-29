//
//  LOGREG+CoreDataProperties.swift
//  LOGREG
//
//  Created by macbook on 25/11/22.
//
//

import Foundation
import CoreData


extension LOGREG {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LOGREG> {
        return NSFetchRequest<LOGREG>(entityName: "LOGREG")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phno: String?
    
    
}

extension LOGREG : Identifiable {
    

}
