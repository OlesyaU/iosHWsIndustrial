//
//  Photos.swift
//  Navigation
//
//  Created by Олеся on 16.04.2022.
//

import UIKit
struct Photo {
    let photo: UIImage!
    static func photos() -> [Photo] {
        var array = [Photo]()
        array.append(Photo(photo: UIImage(named:"шрек")))
        array.append(Photo(photo: UIImage(named:"рио")))
        array.append(Photo(photo: UIImage(named:"рапунцель")))
        array.append(Photo(photo: UIImage(named:"скрудж и крабс")))
        array.append(Photo(photo: UIImage(named:"газ")))
        array.append(Photo(photo: UIImage(named:"гном")))
        array.append(Photo(photo: UIImage(named:"джин")))
        array.append(Photo(photo: UIImage(named:"дональд")))
        array.append(Photo(photo: UIImage(named:"дятел Вудди")))
        array.append(Photo(photo: UIImage(named:"кенга")))
        array.append(Photo(photo: UIImage(named:"король лев")))
        array.append(Photo(photo: UIImage(named:"лев Алекс")))
        array.append(Photo(photo: UIImage(named:"львенок")))
        array.append(Photo(photo: UIImage(named:"микки")))
        array.append(Photo(photo: UIImage(named:"мини")))
        array.append(Photo(photo: UIImage(named:"монстры")))
        array.append(Photo(photo: UIImage(named:"плуто")))
        array.append(Photo(photo: UIImage(named:"птахиРио")))
        array.append(Photo(photo: UIImage(named:"пятачок")))
        array.append(Photo(photo: UIImage(named:"винни и все")))
        array.append(Photo(photo: UIImage(named:"вжик")))
        array.append(Photo(photo: UIImage(named:"русалочка")))
        array.append(Photo(photo: UIImage(named:"гаечка")))
        array.append(Photo(photo: UIImage(named:"тимон")))
        array.append(Photo(photo: UIImage(named:"чип")))
        array.append(Photo(photo: UIImage(named:"бэмби")))
        return array
    }
    
}
