//
//  Router.swift
//  El-Mataar
//
//  Created by Gamal Mostafa on 02/10/2021.
//

import Foundation
import UIKit
import FittedSheets

class Router{
    
    static func navigateTo(_ navigationTarget: NavigationTarget){
        let vc = navigationTarget.getViewController()
        if let navigationController = UIApplication.shared.windows[0].rootViewController as? UINavigationController {
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    static func openSheet(_ navigationTarget: NavigationTarget ,withSizes sizes: [SheetSize]){
        let vc = navigationTarget.getViewController()
        let sheetController = SheetViewController(controller: vc,sizes: sizes)
        UIApplication.getTopViewController()?.present(sheetController, animated: true)
        
    }
}


enum NavigationTarget {
    case airLineDetails(airLineDetailsViewModel: AirLineDetailsViewModel)
    case addAirLines
    case airLineWebView(url: String)
    
    func getViewController()-> UIViewController{
        switch self {
        case .airLineDetails(let airLineDetailsViewModel):
            let vc = AirLineDetailsViewController.instantiate()
            vc.viewModel = airLineDetailsViewModel
            return vc
        case .addAirLines:
            return AddAirLineViewController.instantiate()
        case .airLineWebView(let url):
            let vc = AirLineWebViewController.instantiate()
            vc.url = url
            return vc
        }
    }
}
