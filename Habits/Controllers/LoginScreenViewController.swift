import UIKit

final class LoginScreenViewController: UIViewController {
    
    private var loginScreenView: LoginScreenView? {
        view as? LoginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = LoginScreenView()
    }
}

