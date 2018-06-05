import UIKit
import SnapKit

class FlowerDetailsHeaderView: UIView {
  private lazy var flowerImageView: UIImageView = {
    let imageView = UIImageView.autolayoutView()

    imageView.contentMode = .scaleAspectFill

    return imageView
  }()

  private lazy var flowerNameLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 24)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 0

    return label
  }()

  func present(flower: Flower) {
    flowerNameLabel.text = flower.name
    flowerImageView.kf.setImage(with: URL(string: flower.url))
  }
}

// MARK: - ViewLifecycle
extension FlowerDetailsHeaderView: ViewLifecycle {
  func setup() {
    setupViews()
    setupConstraints()
  }

  func setupViews() {
    addSubview(flowerImageView)
    addSubview(flowerNameLabel)
  }

  func setupConstraints() {
    flowerImageView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }

    flowerNameLabel.snp.makeConstraints { (make) in
      make.top.left.right.equalToSuperview().inset(UIEdgeInsets(top: 64, left: 40, bottom: 0, right: 40))
    }
  }
}
