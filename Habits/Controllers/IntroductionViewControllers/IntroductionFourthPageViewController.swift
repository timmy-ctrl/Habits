import UIKit

final class IntroductionFirstPageViewController: UIViewController {
    
    private var introductionPageOneView: IntroductionFirstPageView? {
        view as? IntroductionFirstPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    

    override func loadView() {
        self.view = IntroductionFirstPageView()
    }
}
