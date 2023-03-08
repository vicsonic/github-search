//
//  IsPreview.swift
//  GitHubSearch
//
//  Created by Victor Soto on 07/03/23.
//

import SwiftUI

extension GitHubSearchApp {
    static var isPreview: Bool {
        guard
            let runningForPreviews = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"]
        else {
            return false
        }
        return runningForPreviews == "1"
    }
}
