//
//  LinkDetailsScreen+Observable.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 24.12.2022.
//

import Foundation
extension LinkDetailsScreen {
    class Observable: ObservableObject {
        @Published var list: [AnyElementModel] = []
        init(_ url: String) {
            loadList(url)
        }
        
        private func loadList(_ url: String) {
            Networking.shared.fetchList(url) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.list = response.body.map{ $0.elementModel }
                case .failure(let errorr): //TODO: show some alert
                    print(errorr.localizedDescription)
                }
            }
        }
    }
}
