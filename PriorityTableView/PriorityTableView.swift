//
//  ViewController.swift
//  PriorityTableView
//
//  Created by Egon Fiedler on 5/9/19.
//  Copyright © 2019 App Solutions. All rights reserved.
//

import UIKit
import SnapKit

class PriorityViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var priorityQueue = PriorityQueue<Date>()
    var containerAlertView = UIView(frame: .zero)
    var textField = UITextField(frame: .zero)
    var alertIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createViewWithTF()
        
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
    
    @IBAction func addDateAction(_ sender: UIBarButtonItem) {
       containerAlertView.isHidden = false
    }
    
    @IBAction func dequeue(_ sender: UIBarButtonItem) {
        let _ =  priorityQueue.dequeue()
        tableview.reloadData()
    }
    
    // MARK: - HELPERS
    
    func createViewWithTF(){
        containerAlertView = UIView(frame: .zero)
        containerAlertView.backgroundColor = .lightGray
        containerAlertView.isHidden = true
        textField = UITextField(frame: .zero)
        textField.backgroundColor = .darkGray
        textField.tintColor = .white
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Insert date in this format 1995-3-10",
                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.view.addSubview(containerAlertView)
        let dismissButton = UIButton(frame: .zero)
        dismissButton.backgroundColor = .darkGray
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.setTitle("Add", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        containerAlertView.addSubview(textField)
        containerAlertView.addSubview(dismissButton)
        containerAlertView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
            make.height.equalTo(150)
        }
        textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(50)
        }
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
    }
    
    @objc func dismissAlert(){
        containerAlertView.isHidden = true
        if textField.text == "" { return }
        let newDate = Date(dateString: textField.text ?? " ")
        priorityQueue.add(newDate)
        tableview.reloadData()
    }
}

extension PriorityViewController: UITableViewDelegate, UITableViewDataSource{
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
}

