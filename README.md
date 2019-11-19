[![Swift Package Manager: Supported](https://img.shields.io/badge/Swift%20Package%20Manager-Supported-success)]()
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# RDAdjustableNavigationController

Available adjustemtns:
- navigation bar height
- navigation bar content alignment (top, middle, bottom)

## Usage example:

```swift
import RDAdjustableNavigationController

let viewController = UIViewController()

let navigationController = RDAdjustableNavigationController(rootViewController: viewController)
navigationController.useSystemHeight = false
navigationController.navigationBarHeight = 52.0
navigationController.contentVerticalAlignment = .bottom
```

## Installation:

Via Swift Package Manager:
1. In your Xcode project choose File -> Swift Packages -> Add Package Dependency...
2. Follow the instructions. In the nessessary field insert URL of this repository.

Currently only Swift Package Manager is supported. 
Though, Xcode 11 has great built in SPM support - if you'd like to use this framework it's a good chance to give SPM a try :)
