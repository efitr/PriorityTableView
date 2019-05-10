//
//  UIPriorityTableView.swift
//  PriorityTableView
//
//  Created by Egon Fiedler on 5/9/19.
//  Copyright © 2019 App Solutions. All rights reserved.
//

import UIKit

class UIPriorityTableView: UIViewController {

    var tableView: UITableView!
    
    open var hasUncommittedUpdates: Bool { get }
    
    

}

extension UIPriorityTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        
    }
    
    func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        
    }
    
    func reloadData() {
        
    }
    
    
}
