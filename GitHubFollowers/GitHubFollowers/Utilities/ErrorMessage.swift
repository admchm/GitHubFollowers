//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Adam Chomicki on 21/03/2023.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "This user name created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request, please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please, try again."
    case invalidData = "The data received from the server was invalid. Please, try again."
}
