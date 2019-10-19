//
//  HomeController.swift
//  Sun*Hackathon
//
//  Created by Bùi Xuân Huy on 10/19/19.
//  Copyright © 2019 huy. All rights reserved.
//

class HomeController: UIViewController, BindableType {
   
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func config() {
        let layout = UICollectionViewFlowLayout().then {
            let itemWidth = collectionView.witdh * 1 / 2
            let itemHeight = collectionView.height
            $0.itemSize = CGSize(width: itemWidth, height: itemHeight)
            $0.scrollDirection = .horizontal
        }
        collectionView.register(cellType: AdvertiseCell.self)
        collectionView.collectionViewLayout = layout
    }
    
    func bindViewModel() {
        let input = HomeViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        output.vouchers
            .drive(collectionView.rx.items) { (collectionview, index, voucher) in
                let indexPath = IndexPath(row: index, section: 0)
                let cell: AdvertiseCell = self.collectionView.dequeueReusableCell(for: indexPath)
                cell.setContentCell(voucher: voucher)
                return cell
            }
            .disposed(by: rx.disposeBag)
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
        output.indicator.drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
    }
}

extension HomeController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.home
}
