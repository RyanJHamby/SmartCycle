//
//  SettingsSection.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/14/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
    var description: String {
        switch self {
        case .Social : return "Social"
        }
    }
}

enum SettingsOptions: Int, CaseIterable, CustomStringConvertible {
    case editProfile
    case redeemedRewards
     case logout
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .redeemedRewards: return "Previously Redeemed Rewards"
        case .logout: return "Log Out"
        
        }
    }
}
