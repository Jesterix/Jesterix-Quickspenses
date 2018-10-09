//
//  MainProtocols.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation

enum DataType : String {
    case date
    case sum
    case purpose
    case wallet
    case comment
}

protocol MainViewProtocol: class {
//    func setUrlButtonTitle(with title: String)
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureTableViewRows() -> Int
    func configureCellForRow(row: Int, type: DataType) -> String
    func settingsButtonTapped()
//    func configureView()
//    func closeButtonClicked()
//    func urlButtonClicked(with urlString: String?)
}

protocol MainInteractorProtocol: class {
    var transactions : [Transaction] { get }
//    func openUrl(with urlString: String)
}

protocol MainRouterProtocol: class {
    func showSettingsScene()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
