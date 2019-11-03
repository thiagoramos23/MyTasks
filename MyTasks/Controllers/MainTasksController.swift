//
//  MainTasksController.swift
//  MyTasks
//
//  Created by Thiago Ramos on 26/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundationœ
import UIKit

class MainTasksController : UIViewController {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksTableView.register(UINib(nibName: "TasksCell", bundle: nil), forCellReuseIdentifier: "TasksCell")
    }
}

extension MainTasksController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath) as! TasksTableViewCell
        cell.hourLabel.text = "08:30"
        cell.taskTypeLabel.text = "Marketing"
        cell.taskTextLabel.text = "Need to understand dasdasdadasdas da daadsdadadasdsadasdas  dasj jdakl djakldjalkdjaskl djkalsdjak lsdj"
        
        return cell
    }
    
    
    
}
