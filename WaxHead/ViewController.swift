//
//  ViewController.swift
//  WaxHead
//
//  Created by Joshua Martin on 6/16/17.
//  Copyright © 2017 Joshua Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    var records : [Record] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
        records = try context.fetch(Record.fetchRequest())
        tableView.reloadData()
        }
        catch{
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let record = records[indexPath.row]
        cell.textLabel?.text = record.title
        cell.imageView?.image = UIImage(data: record.image as! Data)
        return cell
    }
} //final declaration

