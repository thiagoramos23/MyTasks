//
//  CreateTasksViewController.swift
//  MyTasks
//
//  Created by Thiago Ramos on 27/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import UIKit
import DatePicker

struct Category {
    var id = UUID()
    var name: String
}

let defaultCategories = [
    Category(name: "Marketing"),
    Category(name: "Groceries"),
    Category(name: "Work"),
    Category(name: "Study"),
    Category(name: "To Do"),
]

class CreateTasksViewController: UIViewController {

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var dateTimeView: UIView!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var selectedCategory: Category = defaultCategories[0]
    private let datePicker = DatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        addCornerRadius()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        highlightSelectedCategory()
    }
    
    @IBAction func tapCreateTask(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: Interface Changes
extension CreateTasksViewController {
    
    func addCornerRadius() {
        self.confirmButton.layer.cornerRadius = 5.0
        self.categoryView.layer.cornerRadius = 5.0
        self.taskNameTextField.layer.cornerRadius = 5.0
        self.dateTimeView.layer.cornerRadius = 5.0
    }
    
    func highlightSelectedCategory() {
        let cell = self.categoryCollectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor(red: 239, green: 239, blue: 251, alpha: 1)
    }
}

extension CreateTasksViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryNameLabel.text = defaultCategories[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.indexPathsForVisibleItems.forEach { indexPath in
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cell.backgroundColor = .clear
        }
        
        self.selectedCategory = defaultCategories[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor(red: 239, green: 239, blue: 251, alpha: 1)
    }
}

