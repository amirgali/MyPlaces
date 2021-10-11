//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Амиргали Туралинов on 11.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    
    @IBOutlet weak var imageOfPlace: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Уберем разлиновку пустый строк
        tableView.tableFooterView = UIView()

    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Добавим 2 костанты с изображениями камеры и фото
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            // Добавляем ActionSheet для добавления изображения
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            //  Определим список пользовательских действий
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                // TODO: вызовем метод chooseImagePicker для выбора изображения
                self.chooseImagePicker(source: .camera)
            }
            // Устанавливаем изображение этому пункту меню
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                // TODO: вызовем метод chooseImagePicker для фото и камеры
                self.chooseImagePicker(source: .photoLibrary)
            }
            // Устанавливаем изображение этому пункту меню
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
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
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        // Добавим проверку на доступность выбора изображений
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            
            // Кто будет делегировать обязанности по выполнению данного метода? И кто будет делегатом?
            imagePicker.delegate = self
            
            // Позволяет редактировать изображение перед тем как применить
            imagePicker.allowsEditing = true
            // Определяем тип источника для выбора изображения
            imagePicker.sourceType = source
            // Как и любой контроллер - Алерт контроллер необходимо вызвать
            present(imagePicker, animated: true)
        }
    }
    
    // Реализуем свойство editedImage, которое позволяет изпользовать отредактированное пользователем изображение
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Необходимо присвоить оутлету изображение и привести к значению UIImage
        imageOfPlace.image = info[.editedImage] as? UIImage
        
        // Далее работает над форматом изображения
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        
        // Определившиьс с изображением и настройкой формата - необходимо закрыть ImagePickerController
        dismiss(animated: true)
    }
}
