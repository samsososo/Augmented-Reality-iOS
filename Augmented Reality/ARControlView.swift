//
//  ARControlView.swift
//  Augmented Reality
//
//  Created by Sam on 27/3/2021.
//

import Foundation
import SwiftUI

struct ControlView: View {
    var body: some View {
        VStack {
            ControlVisibilityToggleButton()
            Spacer()
            ControlButtonBar()
        }
    }
}
struct ControlVisibilityToggleButton: View {
    var body: some View {
        HStack{
            
        }
    }
}

struct ControlButtonBar: View {
    var body: some View {
        HStack{
            Button(action: {
                print("hi")
            }) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
            .frame(width: 50, height: 50)
            Spacer()
            Button(action: {
                print("hi")
            }) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
            .frame(width: 50, height: 50)
            Spacer()
            Button(action: {
                print("hi")
            }) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
            .frame(width: 50, height: 50)
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    let systemIconName: String
}
