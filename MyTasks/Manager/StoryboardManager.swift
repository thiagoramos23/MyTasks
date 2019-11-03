//
//  StoryboardManager.swift
//  MyTasks
//
//  Created by Thiago Ramos on 27/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import Foundation
import UIKit

class StoryboardManager {
    var storyboard: UIStoryboard
    
    init(_ storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
    
    func createTasksViewController() -> CreateTasksViewController {
        return self.storyboard.instantiateViewController(identifier: "CreateTasksViewController") as! CreateTasksViewController
    }
}
