//
//  PlacementSettings.swift
//  Augmented Reality
//
//  Created by sam.y.so on 31/3/2021.
//

import Foundation
import SwiftUI
import Combine

class PlacementSettings: ObservableObject {
    @Published var selectedModel: Model? {
        willSet(newValue){
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    @Published var confirmedModel: Model? {
        willSet(newValue){
            guard let model = newValue else {
                print("Clearing confirmedModel")
                return
            }
            print("Setting confirmModel to \(model.name)")
        }
    }
    var sceneObserver: Cancellable?
}
