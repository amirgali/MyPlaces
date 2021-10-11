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
            // Добавляем ActionSheet для добавления изображения
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            //  Определим список пользовательских действий
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                // TODO: вызовем метод chooseImagePicker для выбора изображения
                self.chooseImagePicker(source: .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                // TODO: вызовем метод chooseImagePicker для фото и камеры
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            // Все пользовательские действия вписываем в алерт контроллер
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            // Как и любой контроллер - Алерт контроллер необходимо вызвать
            present(actionSheet, animated: true)
            
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

// MARK: Work with image
extension NewPlaceViewController {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        // Добавим проверку на доступность выбора изображений
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            // Позволяет редактировать изображение перед тем как применить
            imagePicker.allowsEditing = true
            // Определяем тип источника для выбора изображения
            imagePicker.sourceType = source
            // Как и любой контроллер - Алерт контроллер необходимо вызвать
            present(imagePicker, animated: true)
        }
    }
}
