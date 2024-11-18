import UIKit

extension UILabel {
    func textUppercased(text: String) {
        self.text = text.uppercased()
    }
    func alignmentCenter() {
        self.textAlignment = .center
    }
    func bigFont() {
        self.font = .systemFont(ofSize: 30, weight: .bold)
    }
    func middleFont() {
        self.font = .systemFont(ofSize: 16, weight: .bold)
    }
    func smallFont() {
        self.font = .systemFont(ofSize: 12, weight: .regular)
    }
}
