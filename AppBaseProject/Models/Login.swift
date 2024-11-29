//
//  Login.swift
//  AppBaseProject
//
//  Created by Pagotto, Paola Fagundes on 29/10/2024.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
