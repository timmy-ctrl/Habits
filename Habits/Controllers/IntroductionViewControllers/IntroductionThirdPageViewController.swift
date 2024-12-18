import UIKit

final class IntroductionFourthPageViewController: UIViewController {
    
    private var introductionPageOneView: IntroductionFourthPageView? {
        view as? IntroductionFourthPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func loadView() {
        self.view = IntroductionFourthPageView()
    }
}
