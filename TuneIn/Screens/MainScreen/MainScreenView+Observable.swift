//
//  MainScreenView+Observable.swift
//  TuneIn
//
//  Created by Andrii Andreiev on 23.12.2022.
//

import Combine
import Foundation

extension MainScreenView {
    class Observable: ObservableObject {
        private var cancelables: Set<AnyCancellable> = []
        
        @Published var menuSelection: Int = -1
        @Published var menu: [LinkElementModel] = []
        @Published var list: [AnyElementModel] = []
        
        init() {
            addSubscribers()
            loadMenu()
        }
        
        private func addSubscribers() {
            $menuSelection
                .sink(receiveValue: { [weak self] value in
                    self?.loadList(index: value)
                })
                .store(in: &cancelables)
        }
        
        private func loadMenu() {
            Networking.shared.fetchMenu { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.menu = response.body.compactMap { $0.elementModel as? LinkElementModel }
                    guard !self.menu.isEmpty else { return }
                    self.menuSelection = 0
                case .failure(let errorr): //TODO: show some alert
                    print(errorr.localizedDescription)
                }
            }
        }
        
        private func loadList(index: Int) {
            guard menu.indices.contains(index) else { return }
            Networking.shared.fetchList(menu[index].url) { [weak self] result in
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
