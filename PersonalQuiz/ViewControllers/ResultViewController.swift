//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by EkaterinaP on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var animalTypelLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - Public properties
    var answers: [Answer]!
    
    //MARK: - Private properties
    private var dictAnimals: [Animal: Int] = [:]
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
    }
    
    //MARK: - Private Methods
    
    private func updateResult() {
//        var frequencyOfAnimals: [Animal: Int] = [:]
//        let animals = answers.map { $0.animal }
        
        /*
//        for animal in animals {
//            if let animalTypeCount = frequencyOfAnimals[animal] {
//                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
//            } else {
//                frequencyOfAnimals[animal] = 1
//            }
//        }
        */
        
        /*
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
//        }
//
//        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
//        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
//
//        updateUI(with: mostFrequencyAnimal)
        */
        // Решение в одну строку
        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal }.sorted { $0.value.count > $1.value.count }.first?.key
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        animalTypelLabel.text = "Вы \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}

//countAnswers(answers)
//
//guard let maxAnimalChosen = dictAnimals.max (by: { $0.value < $1.value }) else { return }
//
//animalTypelLabel.text = "Вы \(maxAnimalChosen.key.rawValue)"
//descriptionLabel.text = "\(maxAnimalChosen.key.definition)"
//    private func countAnswers(_ answers: [Answer]) {
//        for answer in answers {
//            switch answer.animal {
//            case .dog:
//                dictAnimals[.dog] = (dictAnimals[.dog] ?? 0) + 1
//            case .cat:
//                dictAnimals[.cat] = (dictAnimals[.cat] ?? 0) + 1
//            case .rabbit:
//                dictAnimals[.rabbit] = (dictAnimals[.rabbit] ?? 0) + 1
//            case .turtle:
//                dictAnimals[.turtle] = (dictAnimals[.turtle] ?? 0) + 1
//            }
//        }
//    }
//}
