//
//  AddAccount.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import Foundation
import UIKit


struct AddAccount  {
    var image: SetUpImage
    var title: SetUpTitle
}

enum SetUpImage: CaseIterable {
    case googleImage
    case iCloudImage
    case outlookImage
    case officeImage
    case yahooImage
    case otherImage
    
    func addImageAction() -> UIImage {
        switch self {
        case .googleImage:
            return UIImage(named: "google")!
        case .iCloudImage:
            return UIImage(named: "iCloud")!
        case .outlookImage:
            return UIImage(named: "outlook")!
        case .officeImage:
            return UIImage(named: "office")!
        case .yahooImage:
            return UIImage(named: "yahoo")!
        case .otherImage:
            return UIImage(named: "other")!
        }
    }
    
}

enum SetUpTitle: CaseIterable {
    
    case google
    case iCloud
    case outlookHotmailAndLive
    case office365
    case yahoo
    case otherImap
    
    func addTitleAction() -> String {
        switch self {
        case .google:
            // Handle Google account addition
            return "Google"
        case .iCloud:
            // Handle iCloud account addition
            return "iCloud"
        case .outlookHotmailAndLive:
            // Handle Outlook, Hotmail, and Live account addition
            return "Outlook, Hotmail and Live"
        case .office365:
            // Handle Office 365 account addition
            return "Office 365"
        case .yahoo:
            // Handle Yahoo account addition
            return "Yahoo"
        case .otherImap:
            // Handle other IMAP account addition
            return "Other (IMAP)"
        }
    }
}

