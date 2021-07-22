//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var backButton: UINavigationItem!
    
    var answers : [Answer] = []
    
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let currentAnimal = countAnimals(answers)
        headLabel.text = "Вы - \(currentAnimal!.rawValue)!"
        textLabel.text = currentAnimal?.definition
    }
    
}
extension ResultsViewController {
    private func countAnimals(_ answers: [Answer]) -> AnimalType? {
        var arrayOfAnimals = [AnimalType]()
        
        for answer in answers {
            arrayOfAnimals.append(answer.type)
        }
        
        var result: AnimalType?
        var dictionary = [AnimalType: Int]()
            
        arrayOfAnimals.forEach { (element) in
            if let count = dictionary[element] {
                dictionary[element] = count + 1
            } else {
                dictionary[element] = 1
            }
        }
            
        var max = 0
            
        for(key, value) in dictionary {
            if value > max {
                max = value
                result = key
            }
        }
        
        return result
    }
}
