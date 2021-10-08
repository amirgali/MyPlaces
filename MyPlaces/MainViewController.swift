//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Амиргали Туралинов on 08.10.2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O.", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        // Вернем количество ячеек равное количеству элементов массива
        return restaurantNames.count
    }

    
    // Работа с конфигурациями ячеек, withIdentifier - прописываем ID Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        // row - возвращает целочисленной значение индекса
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        
        // Поработаем с изображениями. Присвоим UIImage изображения с названиями заведений
        cell.imageOfPlace?.image = UIImage(named: restaurantNames[indexPath.row])
        
        // Сделаем изображения круглыми. Сначала скруглим imageView
        cell.imageOfPlace?.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        // Затем обрежем изображение по границе imageView
        cell.imageOfPlace?.clipsToBounds = true
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    // За высоту строки отвечает этот метод
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
