//
//  Model.swift
//  Augmented Reality
//
//  Created by sam.y.so on 30/3/2021.
//

import Foundation
import RealityKit
import Combine
import UIKit.UIImage

enum ModelCategory: CaseIterable {
    case fire
    case water
    case electronic

    
    var label: String {
        get {
            switch self {
            case .fire:
                return "Fire"
            case .water:
                return "Water"
            case .electronic:
                return "Electricity"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    private var cancellable: AnyCancellable?
    init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
    }
    func asyncLoadModelEntity() {
        let filename = self.name + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Unable to load \(filename), Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
            })
    }
    
}

struct Models {
    var all: [Model] = []
    init() {
        // fire
        let fire = Model(name: "fire_selection", category: .fire, scaleCompensation: 0.32/100)
        self.all += [fire]
        
        let water = Model(name: "water_selection", category: .water, scaleCompensation: 0.32/100)
        self.all += [water]

        // electronic
        let electronic = Model(name: "electronic_selection", category: .electronic, scaleCompensation: 0.01)

        self.all += [electronic]

    }
    func get(category: ModelCategory) -> [Model]{
        return all.filter({$0.category==category})
    }
}
