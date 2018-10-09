//
//  ViewController.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 13.08.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainViewProtocol {

    var presenter: MainPresenterProtocol!
    let configurator: MainConfiguratorProtocol = MainConfigurator()
    let selfToSettingsSegueName = "toSettingsSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        //если надо настроить экран то:
//        presenter.configureView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.configureTableViewRows() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        cell.selectionStyle = .none
        if indexPath.row < indexPath.count - 1 {
            cell.dateField.text = presenter.configureCellForRow(row: indexPath.row, type: DataType.date)
            cell.sumField.text = presenter.configureCellForRow(row: indexPath.row, type: DataType.sum)
            cell.purposeField.text = presenter.configureCellForRow(row: indexPath.row, type: DataType.purpose)
            cell.fromField.text = presenter.configureCellForRow(row: indexPath.row, type: DataType.wallet)
            cell.commentTextView.text = presenter.configureCellForRow(row: indexPath.row, type: DataType.comment)
        } else {
            let notSavedTextColor = UIColor.blue
            cell.dateField.text = ""
            cell.dateField.textColor = notSavedTextColor
            cell.sumField.text = ""
            cell.sumField.textColor = notSavedTextColor
            cell.purposeField.text = ""
            cell.purposeField.textColor = notSavedTextColor
            cell.fromField.text = ""
            cell.fromField.textColor = notSavedTextColor
            cell.commentTextView.text = ""
            cell.commentTextView.textColor = notSavedTextColor
        }
        return cell
    }
    
    
    @IBAction func sendTapped(_ sender: Any) {
        //методы презентера?
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //методы презентера?
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        //методы презентера?
        presenter.settingsButtonTapped()
    }
    

}


//0) сделать доп.ячейку, в которой можно вводить новые данные, данные вводятся синим цветом, при нажатии на Add добавляются в базу, цвет текста становится черным и появляется новая пустая строка.
//1) реализовать выбор из категории расходов
//2) то же для источника денег
//3) сетап, в котором можно наполнить базу категорий, предположительно 3 символа включая эмодзи + описание текстовое, которое показывают в pickerView
//4) наполнение базы источников
//5) комментарии показывать textFieldом(длинные записи сокращаются), при нажатии - переходим на страницу записи для подробного редактирования/просмотра
//6) создание csv из базы данных и отправка по почте
//7) по кнопке Add переходим на страницу записи и добавляем новую или же внизу шаблон для заполнения, а когда нажимаешь кнопку - добавляет строку. Поле Комментарии можно потом добавить
//8) UITableViewRowAction - удалить и скопировать
//9) экраны на 05.10.18 - основной, экран записи для редактирования, экран настроек
