//
//  ExpenseCell.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 13.08.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import UIKit

class ExpenseCell: UITableViewCell {

    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var sumField: UITextField!
    @IBOutlet weak var purposeField: UITextField!
    @IBOutlet weak var fromField: UITextField!
    
    @IBOutlet weak var commentTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func dateFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.locale = Locale(identifier: "ru_RU")
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateField.text = dateFormatter.string(from: sender.date)
    }
    
}
