import UIKit

struct AppViewControllersFactory {

    let home: () -> UIViewController
    let action: () -> UIViewController
    let tabBar: ([UIViewController]) -> UIViewController

}
