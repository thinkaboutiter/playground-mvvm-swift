//
//  InitialDependencyContainer.swift
//  MvvmSampleSwift
//
//  Created by Boyan Yankov on 2019-W29-20-Jul-Sat.
//  Copyright © 2019 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

class InitialDependecyContainer {
    
    // MARK: - Initialization
    init() {
        // setup
        Logger.success.message()
    }
    
    deinit {
        Logger.fatal.message()
    }
    
    // MARK: - Factory methods
    func makeInitialViewController() -> InitialViewController {
        let vm: InitialViewModel = self.makeInitialViewModel()
        let vc: InitialViewController = InitialViewController(viewModel: vm)
        return vc
    }
    
    private func makeInitialViewModel() -> InitialViewModel {
        let result: InitialViewModel = InitialViewModelImpl()
        return result
    }
}
