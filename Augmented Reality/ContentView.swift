//
//  ContentView.swift
//  Augmented Reality
//
//  Created by sam.y.so on 14/3/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State private var shouldShowModal: Bool = false
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    let tabBarImageNames = ["house", "arkit", "gear"]
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModal, content: {
                        MainARView(shouldShowModal: $shouldShowModal)
                })
                
                switch selectedIndex {
                case 0:
                    HomeView()
      
                
                case 2:
                    SettingsView()
                    
                default:
                    NavigationView {
                        Text("Remaining tabs")
                        
                    }
                }
                
            }

            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<3) { num in
                    Button(action: {
                        if num == 1 {
                            shouldShowModal.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        if num == 1 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        Spacer()
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
