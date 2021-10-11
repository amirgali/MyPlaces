//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Амиргали Туралинов on 08.10.2021.
//

import UIKit

class MainViewController: UITableViewController {

    
    // Мы должны заменить массив с названиями заведений на массив с типом нашей модели - с объектами Place c name, location, type, image
    let places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        // Вернем количество ячеек равное количеству элементов массива
        return places.count
    }

    
    // Работа с конфигурациями ячеек, withIdentifier - прописываем ID Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        // row - возвращает целочисленной значение индекса
        cell.nameLabel?.text = places[indexPath.row].name
        
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        
        // Поработаем с изображениями. Присвоим UIImage изображения с названиями заведений
        cell.imageOfPlace?.image = UIImage(named: places[indexPath.row].image)
        
        // Сделаем изображения круглыми. Сначала скруглим imageView
        cell.imageOfPlace?.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        // Затем обрежем изображение по границе imageView
        cell.imageOfPlace?.clipsToBounds = true
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) { }

}
