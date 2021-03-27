//
//  ARControlView.swift
//  Augmented Reality
//
//  Created by Sam on 27/3/2021.
//

import Foundation
import SwiftUI

struct ControlView: View {
    @Binding var shouldShowModal: Bool
    var body: some View {
        VStack {
            ControlVisibilityToggleButton(
                shouldShowModal: $shouldShowModal
            )
            Spacer()
            ControlButtonBar()
        }
    }
}
struct ControlVisibilityToggleButton: View {
    @Binding var shouldShowModal: Bool
    var body: some View {
        HStack{
            
            ZStack {
                Color.black.opacity(0.25)
                Button(action: {
                    print("Control")
                    self.shouldShowModal.toggle()
                }){
                    Image(systemName: "arrow.backward")
                        .font(.system(size:25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width:50, height:50)
            .cornerRadius(8.0)
            Spacer()
        }
        .padding(.top, 45)
        .padding(.leading, 20)
    }
}

struct ControlButtonBar: View {
    var body: some View {
        HStack{
            ControlButton(systemIconName: "clock.fill"){
                print("hi")
            }
            Spacer()
            ControlButton(systemIconName: "square.grid.2x2"){
                print("hi")
            }
            Spacer()
            ControlButton(systemIconName: "slider.horizontal.3"){
                print("hi")
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }){
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }.frame(width:50, height: 50)
    }
}
