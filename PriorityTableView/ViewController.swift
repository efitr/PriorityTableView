//
//  ViewController.swift
//  PriorityTableView
//
//  Created by Egon Fiedler on 5/9/19.
//  Copyright © 2019 App Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var priorityQueue = PriorityQueue<Date>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dummydate = Date(dateString: "2011-3-10")
        let dummydate2 = Date(dateString: "2011-4-10")
        let dummydate3 = Date(dateString: "2011-5-10")
        let dummydate4 = Date(dateString: "2011-6-10")
        let dummydate5 = Date(dateString: "2011-7-10")
        let dummydate6 = Date(dateString: "2011-8-10")
        priorityQueue.add(dummydate)
        priorityQueue.add(dummydate2)
        priorityQueue.add(dummydate3)
        priorityQueue.add(dummydate4)
        priorityQueue.add(dummydate5)
        priorityQueue.add(dummydate6)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priorityQueue.size
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DateCell
        let value = priorityQueue.getValueAtIndex(indexPath.row)
        cell.dateLabel.text = value?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBAction func addDateAction(_ sender: UIBarButtonItem) {
        
    }
    
    
}

