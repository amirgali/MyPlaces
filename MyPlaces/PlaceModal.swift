//
//  PlaceModal.swift
//  MyPlaces
//
//  Created by Амиргали Туралинов on 08.10.2021.
//

import Foundation

struct Place {
    
    // Объявим все необходимые свойства
    var name: String
    var location: String
    var type: String
    var image: String
    
  static  let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O.", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    // Объявим метод, который будет генерировать тестовые записи с названиями из массива restaurantNames
    // static. Сделаем метод статичным, методом структуры, этот метод будет доступен не через экземпляр структуры, а при непосредственном обращении к самой структуре
   static func getPlaces() -> [Place] {
        var places = [Place]()
        
        // В цикле будем последовательно перебирать все элементы массива restaurantNames
        for place in restaurantNames {
            // Добавим в places объекты
            places.append(Place(name: place, location: "Уфа", type: "Ресторан", image: place))
        }
        
        return places
    }
 }
