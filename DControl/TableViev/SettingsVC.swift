//
//  SettingsVC.swift
//  DControl
//
//  Created by Yaroslav on 27.02.2023.
//

import UIKit

class SettingsVC: UIViewController {
    
    var tableView = UITableView()
    // Create empty array
    var videos: [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yaroslavs Videos"
        // Fetch data, put data from NetworkCall to empty array
        videos = fetchData()
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        //register Cell
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        
        tableView.rowHeight  =  100
        
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count // 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}


extension SettingsVC {
    
    func fetchData() -> [Video] {
        let video0 = Video(image: Images.noStoryboard, title: "Agraba")
        let video1 = Video(image: Images.softSkills, title: "Not Smart One")
        let video2 = Video(image: Images.xcode, title: "Hmmm, interesting...")
        let video3 = Video(image: Images.patreon, title: "Crazy dude!")
        let video4 = Video(image: Images.raises, title: "Culture you wish you see and feel")
        let video5 = Video(image: Images.shake, title: "Bluest Flower")
        let video6 = Video(image: Images.salaries, title: "Your dude, giraffe")
        let video7 = Video(image: Images.wireless, title: "Misterious place")
        let video8 = Video(image: Images.swiftNews, title: "Art of my dream")
        let video9 = Video(image: Images.ninety, title: "You wish to live here!")
        
        return [video0, video1, video2, video3, video4, video5, video6, video7, video8, video9]
    }
}
