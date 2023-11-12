import UIKit

class SecondController: UIViewController {
    
    //MARK: - Properties
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "TBC IT Academy"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var gradientLayer: CAGradientLayer!
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateRotate(for: mainLabel)
        animateGradient()
    }
    
    //MARK: - Methods
    
    private func setupUI() {
        view.addSubview(mainLabel)
        setupConstraints()
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func animateRotate(for label: UILabel) {
        UIView.animate(withDuration: 4, delay: 0, options: .curveLinear, animations: {
            label.transform = label.transform.rotated(by: .pi)
        }) { _ in
            self.animateRotate(for: label)
        }
    }
    
    private func animateGradient() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.green.cgColor, UIColor.systemPink.cgColor]
        animation.duration = 4
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "animateGradient")
    }
}

