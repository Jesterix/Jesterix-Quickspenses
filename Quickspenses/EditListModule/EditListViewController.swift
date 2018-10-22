//
//  EditListViewController.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 09.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditListViewProtocol {
    
    var presenter: EditListPresenterProtocol!
    let configurator: EditListConfiguratorProtocol = EditListConfigurator()
    
    var listToEdit = ""
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var dataIsEditing = false
    var currentIndexpath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        addTextField.delegate = self
        addTextField.autocorrectionType = .no

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.configureTableViewRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = presenter.configureTextForRow(row: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexpath) in
            self.addTextField.becomeFirstResponder()
            self.addTextField.text = self.presenter.configureTextForRow(row: indexpath.row)
            self.addButton.setTitle("Edit", for: .normal)
            self.dataIsEditing = true
            self.currentIndexpath = indexpath.row
//            изменить в кордате
            
        }
        editAction.backgroundColor = UIColor.blue
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexpath) in
            //            удалить из кордаты
            self.presenter.deleteObject(row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction, editAction]
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let inputText = addTextField.text else { return }
        if presenter.validateInput(text: inputText) {
            if dataIsEditing {
                //меняем значение в кордате по индексу
                presenter.editObjectInList(row: currentIndexpath, newValue: inputText)
                dataIsEditing = false
                self.addButton.setTitle("Add", for: .normal)
            } else {
                //добавляем значение в кордату
                presenter.addObjectIntList(value: inputText)
            }
            addTextField.text = ""
            listTableView.reloadData()
        } else {
            //show alert
            addTextField.textColor = UIColor.red
        }
    }
    
    
 
}

extension EditListViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = UIColor.black
    }
    
}
