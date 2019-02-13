import UIKit

class CheckBoxView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 20)
    }

    func setSelected(_ isSelected: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.backgroundColor = isSelected ? self.actionColor : .white
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = layer.cornerRadius
    }

    // MARK: - Privates

    private let backgroundView = SubviewFactory.backgroundView()
    private let tickImageView = SubviewFactory.tickImageView()
    private let actionColor = UIColor(rgb: 0x28286B)

    private func configureSubviews() {
        backgroundColor = actionColor
        addSubview(backgroundView)
        backgroundView.addSubview(tickImageView)
        backgroundView.clipsToBounds = true
        let borderWidth: CGFloat = 1
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: borderWidth),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: borderWidth),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -borderWidth),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -borderWidth),
            tickImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tickImageView.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }

}

private extension CheckBoxView {

    struct SubviewFactory {

        static func backgroundView() -> UIView {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }

        static func tickImageView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "tick")
            imageView.contentMode = .center
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

    }

}