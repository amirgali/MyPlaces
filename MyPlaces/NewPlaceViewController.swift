//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Амиргали Туралинов on 11.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Уберем разлиновку пустый строк
        tableView.tableFooterView = UIView()

    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {

        } else {
            // Скрываем клавиатуру
            view.endEditing(true)
        }
    }

}

// MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    // Скрываем клавиатуру по нажатию на Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
