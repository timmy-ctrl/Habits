import UIKit

final class IntroductionSecondPageViewController: UIViewController {
    
    private var introductionPageOneView: IntroductionSecondPageView? {
        view as? IntroductionSecondPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func loadView() {
        self.view = IntroductionSecondPageView()
    }
}
