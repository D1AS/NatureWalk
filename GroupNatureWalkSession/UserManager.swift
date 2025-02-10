//
//  UserManager.swift
//  GroupNatureWalkSession
//
//  Created by Henrique Machitte on 09/02/25.
//
//class UserManager: ObservableObject {
//    @Published var isRememberMeEnabled: Bool = false
//    @Published var loggedInUser: String?
//
//    private let rememberMeKey = "rememberMe"
//    private let loggedInUserKey = "loggedInUser"
//
//    init() {
//        loadUserSettings()
//    }
//
//    func toggleRememberMe(_ value: Bool) {
//        isRememberMeEnabled = value
//        UserDefaults.standard.set(value, forKey: rememberMeKey)
//    }
//
//    func setLoggedInUser(_ username: String?) {
//        loggedInUser = username
//        UserDefaults.standard.set(username, forKey: loggedInUserKey)
//    }
//
//    func loadUserSettings() {
//        isRememberMeEnabled = UserDefaults.standard.bool(forKey: rememberMeKey)
//        loggedInUser = UserDefaults.standard.string(forKey: loggedInUserKey)
//    }
//}

