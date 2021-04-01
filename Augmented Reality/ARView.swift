//
//  ARView.swift
//  Augmented Reality
//
//  Created by Sam on 21/3/2021.
//

import Foundation
import SwiftUI
import RealityKit

struct MainARView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var shouldShowModal: Bool
    @State private var showBrowse: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            if self.placementSettings.selectedModel == nil {
                ControlView(
                    shouldShowModal: $shouldShowModal,
                    showBrowse: $showBrowse
                )
            }else{
                PlacementView()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct  ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    func makeUIView(context: Context) -> CustomARView{
        let arView = CustomARView(frame: .zero)
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, {(event) in
            self.updateScene(for: arView)
        })
        return arView
    }
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    private func updateScene(for arView: CustomARView){
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        if let confirmedModel = self.placementSettings.confirmedModel, let modeEntity = confirmedModel.modelEntity {
            self.place(modeEntity, in: arView)
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView){
        let clonedEntity = modelEntity.clone(recursive: true)
        
        clonedEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, . rotation], for: clonedEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(clonedEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
    }
}
