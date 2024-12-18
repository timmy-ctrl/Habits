import UIKit

class HalfScreenPresentationController: UIPresentationController {

    // Задаем рамки для модального окна (половина экрана снизу)
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        let height = containerView.bounds.height / 2
        return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
    }

    // Настройка затемнения фона
    private let dimmingView = UIView()

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }

        // Настраиваем затемнение
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.frame = containerView.bounds
        dimmingView.alpha = 0
        containerView.addSubview(dimmingView)

        // Анимация появления затемнения
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1
        })
    }

    override func dismissalTransitionWillBegin() {
        // Анимация исчезновения затемнения
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0
        })
    }

    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        dimmingView.frame = containerView?.bounds ?? .zero
    }
}
