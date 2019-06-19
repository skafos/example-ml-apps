// Copyright 2019 The TensorFlow Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Skafos
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    
    // Set Skafos environment keys
    // You can find them under your App Settings tab @ https://dashboard.skafos.ai
    #if DEBUG
    // Use the DEV key if running in DEBUG mode
      let key = "sk_dev_fca05103d25e4330986bc977f20901b0"
    #else
    // Use the PROD key otherwise
      let key = "sk_prod_6566a2ba67f43ecd1bfbbbddf751100c"
    #endif

    // Initialize Skafos
    Skafos.initialize(key, swizzle: true)
    
    return true
  }
}
