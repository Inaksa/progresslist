//
//  File.swift
//  
//
//  Created by Alex Maggio on 07/06/2023.
//

import Foundation

enum Progress {
    case queued
    case paused
    case inProgress(Double)
    case finished
}

extension Progress: Equatable, Hashable {}
