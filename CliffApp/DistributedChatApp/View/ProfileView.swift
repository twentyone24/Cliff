//
//  ProfileView.swift
//  Cliff
//
//  Created by NAVEEN MADHAN on 4/1/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var profile: Profile
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 40) {
                Divider()
                VStack(alignment: .center, spacing: 5) {
                    Text("Your Availability Status")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    EnumPicker(selection: $profile.presence.status, label: ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                            .foregroundColor(.primary)
                        Circle()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(profile.presence.status.color)
                    })
                        .pickerStyle(MenuPickerStyle())
                }
                
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Your Availability Status")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    CliffTextView(title: "Your nickname", text: $profile.presence.user.name)
                        // .font(.title2)
                        .multilineTextAlignment(.center)
                }
                VStack(alignment: .center, spacing: 5) {
                    Text("Your Availability Status")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    CliffTextView(title: "Your custom status", text: $profile.presence.info)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .padding(20)
            .navigationTitle("Profile")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ProfileView_Previews: PreviewProvider {
    @StateObject static var profile = Profile()
    static var previews: some View {
        ProfileView()
            .environmentObject(profile)
    }
}
