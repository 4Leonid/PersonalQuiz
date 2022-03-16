//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by EkaterinaP on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var maxAnimalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - Public properties
    var answers: [Answer] = []
    
    //MARK: - Private properties
    private var dictAnimals: [Animal: Int] = [:]
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        countAnswers(answers)
        
        guard let maxAnimalChosen = dictAnimals.max (by: { $0.value < $1.value }) else { return }
    
        maxAnimalLabel.text = "Вы \(maxAnimalChosen.key.rawValue)"
        descriptionLabel.text = "\(maxAnimalChosen.key.definition)"
    }
    
    //MARK: - Private Methods
    private func countAnswers(_ answers: [Answer]) {
        for answer in answers {
            switch answer.animal {
            case .dog:
                dictAnimals[.dog] = (dictAnimals[.dog] ?? 0) + 1
            case .cat:
                dictAnimals[.cat] = (dictAnimals[.cat] ?? 0) + 1
            case .rabbit:
                dictAnimals[.rabbit] = (dictAnimals[.rabbit] ?? 0) + 1
            case .turtle:
                dictAnimals[.turtle] = (dictAnimals[.turtle] ?? 0) + 1
            }
        }
    }
}
