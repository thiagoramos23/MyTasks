//
//  TasksTableViewCell.swift
//  MyTasks
//
//  Created by Thiago Ramos on 26/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var taskTypeView: UIView!
    @IBOutlet weak var taskTypeLabel: UILabel!
    @IBOutlet weak var taskTextLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        taskTypeView.layer.cornerRadius = 3.0
    }
}
