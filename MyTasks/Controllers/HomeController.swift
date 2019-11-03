//
//  HomeController.swift
//  MyTasks
//
//  Created by Thiago Ramos on 24/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit
import CVCalendar

class HomeController: UIViewController {
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    private var currentCalendar: Calendar?
    
    @IBOutlet weak var addTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.layer.cornerRadius = addTaskButton.frame.width / 2
    }
        
    override func awakeFromNib() {
        let timeZoneBias = 480 // (UTC+08:00)
        currentCalendar = Calendar(identifier: .gregorian)
        currentCalendar?.locale = Locale(identifier: "fr_FR")
        if let timeZone = TimeZone(secondsFromGMT: -timeZoneBias * 60) {
            currentCalendar?.timeZone = timeZone
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    @IBAction func tapCreateNewTask(_ sender: Any) {
        createNewTask()
    }
    
}

// MARK: CVCalendar Delegates
extension HomeController : CVCalendarViewDelegate, CVCalendarMenuViewDelegate {
    
    func presentationMode() -> CalendarMode { return .monthView }
    
    func firstWeekday() -> Weekday { return .sunday }
    
    func calendar() -> Calendar? { return currentCalendar }
    
}

// MARK: Interface Changes
extension HomeController {
    
    func addBorderToCalendar(_ calendarView: CVCalendarView) {
        calendarView.layer.shadowColor = UIColor.lightGray.cgColor
        calendarView.layer.shadowRadius = 2.0
        calendarView.layer.shadowOpacity = 0.2
        calendarView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}

// MARK: Action Buttons
extension HomeController {
    
    func createNewTask() {
        let taskViewController = StoryboardManager(self.storyboard!).createTasksViewController()
        self.present(taskViewController, animated: true)
    }
}

