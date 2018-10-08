//
//  MainPresenter.swift
//  Quickspenses
//
//  Created by Georgy Khaydenko on 07.10.2018.
//  Copyright © 2018 Georgy Khaydenko. All rights reserved.
//

import Foundation



class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    // MARK: - AboutPresenterProtocol methods
    
    func configureTableViewRows() -> Int {
        return interactor.transactions.count
    }
    
    func configureCellForRow(row: Int, type: DataType) -> String {
        let transact = interactor.transactions[row]
        switch type {
        case .date:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: transact.date! as Date)
        case .sum:
            return String(transact.sum)
        case .purpose:
            return transact.purpose ?? ""
        case .wallet:
            return transact.wallet ?? ""
        case .comment:
            return transact.comment ?? ""
        }
    }
    
//    func configureView() {
//        view.setUrlButtonTitle(with: interactor.urlRatesSource)
//    }
    
//    func closeButtonClicked() {
//        router.closeCurrentViewController()
//    }
    
//    func urlButtonClicked(with urlString: String?) {
//        if let url = urlString {
//            interactor.openUrl(with: url)
//        }
//    }
}
