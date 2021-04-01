//
//  SettingView.swift
//  Augmented Reality
//
//  Created by Sam on 21/3/2021.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    // 1.
    @State private var enableAirplaneMode = false
      
    // 2.
    var notificationMode = ["Lock Screen", "Notification Centre", "Banners"]
    @State private var selectedMode = 0
    
    var body: some View {
        NavigationView {
            // 3.
            Form {
                // 4.
                Section(header: Text("General Settings")){
                    Toggle(isOn: $enableAirplaneMode) {
                        Text("Airplane Mode")
                    }
                    
                    Picker(selection: $selectedMode, label: Text("Notifications")) {
                        ForEach(0..<notificationMode.count) {
                            Text(self.notificationMode[$0])
                        }
                    }
                }
                
                // 5.
                Section(header: Text("About")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("Education Purpose")
                    }
                    
                    HStack {
                        Text("Software Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
            } .navigationBarTitle("Settings")
        }
    }
}
