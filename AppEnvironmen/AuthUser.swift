//
//  AuthUser.swift
//  AppEnvironmen
//
//  Created by Claudio Tendean on 16/05/23.
//

import Foundation

class AuthUser: ObservableObject {
    @Published var isLogin : Bool = false
    
    // Print Problem
    @Published var isCorrect : Bool = true
}
