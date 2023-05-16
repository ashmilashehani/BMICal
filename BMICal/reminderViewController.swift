//
//  reminderViewController.swift
//  BMICal
//
//  Created by MacBook Aor on 2023-05-16.
//

import UIKit

class reminderViewController: UIViewController {
    
    @IBOutlet var table : UITableView!
    
    var models = [MyReminder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    

}

extension reminderViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath ){
        tableView.deselectRow(at: indexPath, animated: true)
            
        }
    
}

extension reminderViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
    
}

struct MyReminder{
    let title : String
    let date : Date
    let identifier : String
}
