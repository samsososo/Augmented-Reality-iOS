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
    func makeUIView(context: Context) -> ARView{
        let arView = ARView(frame: .zero)
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}
