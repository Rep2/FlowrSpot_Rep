import UIKit
import SnapKit

class FlowerDetailsHeaderView: UIView {
  private lazy var flowerImageView: UIImageView = {
    let imageView = UIImageView.autolayoutView()

    imageView.kf.indicatorType = .activity
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true

    return imageView
  }()

  private lazy var flowerNameLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 24)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 1
    label.shadowColor = UIColor.black.withAlphaComponent(0.8)
    label.shadowOffset = CGSize(width: 0.5, height: 1)
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var flowerLatinNameLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .italic, size: 16)
    label.textColor = UIColor.white.withAlphaComponent(0.7)
    label.textAlignment = .center
    label.numberOfLines = 1
    label.shadowColor = UIColor.black.withAlphaComponent(0.8)
    label.shadowOffset = CGSize(width: 0.5, height: 1)
    label.minimumScaleFactor = 0.7

    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel.autolayoutView()

    label.font = .custom(type: .regular, size: 13)
    label.textColor = .flowrGray
    label.numberOfLines = 0

    return label
  }()

  func present(flowerDetails: FlowerDetails) {
    flowerNameLabel.text = flowerDetails.flower.name
    flowerLatinNameLabel.text = flowerDetails.flower.latinName
    flowerImageView.kf.setImage(with: URL(string: flowerDetails.flower.url))
    descriptionLabel.text = flowerDetails.description
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
    addSubview(flowerLatinNameLabel)
    addSubview(descriptionLabel)
  }

  func setupConstraints() {
    flowerImageView.snp.makeConstraints { make in
      make.left.right.top.equalToSuperview()
      make.height.equalTo(281)
    }

    flowerLatinNameLabel.snp.makeConstraints { make in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 80, bottom: 24, right: 80))
      make.bottom.equalTo(flowerImageView.snp.bottom).offset(-24)
    }

    flowerNameLabel.snp.makeConstraints { make in
      make.left.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 104, bottom: 0, right: 104))
      make.bottom.equalTo(flowerLatinNameLabel.snp.top).offset(-8)
    }

    descriptionLabel.snp.makeConstraints { make in
      make.left.bottom.right.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 24, bottom: 24, right: 24))
      make.top.equalTo(flowerImageView.snp.bottom).offset(24)
    }
  }
}
