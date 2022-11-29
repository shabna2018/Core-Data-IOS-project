//
//  ViewController.swift
//  LOGREG
//
//  Created by macbook on 25/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var bank = Store()
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var lMod:[LOGREG]?

    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bank.getDetails()
        Table.reloadData()
        Table.dataSource = self
        Table.delegate = self
        Table.frame = view.bounds
        load()
        
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "AddScreen":if let vc = segue.destination as? SaveVC{
                vc.delegate = self
            }
            break
            
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lMod?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = Table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.lMod![indexPath.row].name
        print(cell)
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete"){ [self](action,view,completionHandler)in
            self.bank.deleteItem(item: lMod![indexPath.row])
            load()
            
        }
        let action2 = UIContextualAction(style: .normal, title: "Update"){ [self](action,view,completionHandler)in
            let alert = UIAlertController(title: "Update", message: "Want to update", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil )

            self.present(alert,animated: true)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.bank.updateItem(item: self.lMod![indexPath.row], newname: "")
            
        }
        return UISwipeActionsConfiguration(actions: [action,action2])
    }
    func load(){
        do{
            self.lMod = try context.fetch(LOGREG.fetchRequest())
            DispatchQueue.main.async {
                self.Table.reloadData()
            }
        }
        catch{
        }
    }
}

extension ViewController: EditData{
    func updateData() {
        load()
    }
}

