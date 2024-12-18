import UIKit

final class IntroductionThirdPageViewController: UIViewController {
    
    private var introductionPageOneView: IntroductionThirdPageView? {
        view as? IntroductionThirdPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func loadView() {
        self.view = IntroductionThirdPageView()
    }
}
