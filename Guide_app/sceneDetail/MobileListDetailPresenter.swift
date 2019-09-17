//
//  sceneDetailPresenter.swift
//  Guide_app
//
//  Created by Z64me on 16/9/2562 BE.
//  Copyright (c) 2562 Z64me. All rights reserved.
//

import UIKit

protocol MobileListDetailPresenterInterface {
  func presentSomething(response: MobileListDetail.Something.Response)
}

class MobileListDetailPresenter: MobileListDetailPresenterInterface {
  weak var viewController: MobileListDetailViewControllerInterface!

  // MARK: - Presentation logic

  func presentSomething(response: MobileListDetail.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = MobileListDetail.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
