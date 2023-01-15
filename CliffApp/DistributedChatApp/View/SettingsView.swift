//
//  SettingsView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settings: Settings
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Presentation")) {
                    Toggle(isOn: $settings.presentation.showChannelPreviews) {
                        Text("Show Channel Previews")
                    }
                }
                Section(header: Text("Bluetooth")) {
                    Toggle(isOn: $settings.bluetooth.advertisingEnabled) {
                        Text("Advertise to nearby devices")
                    }
                    Toggle(isOn: $settings.bluetooth.scanningEnabled) {
                        Text("Scan for nearby devices")
                    }
                    Toggle(isOn: $settings.bluetooth.monitorSignalStrength) {
                        Text("Monitor signal strengths")
                    }
                    if settings.bluetooth.monitorSignalStrength {
                        HStack {
                            Text("Monitoring interval in seconds")
                            Spacer()
                            TextField("sec", text: Binding(
                                get: { String(settings.bluetooth.monitorSignalStrengthInterval) },
                                set: {
                                    if let value = Int($0) {
                                        settings.bluetooth.monitorSignalStrengthInterval = value
                                    }
                                }
                            ))
                                .multilineTextAlignment(.trailing)
                                .fixedSize()
                                .keyboardType(.numberPad)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    @StateObject static var settings = Settings()
    static var previews: some View {
        SettingsView()
            .environmentObject(settings)
    }
}
