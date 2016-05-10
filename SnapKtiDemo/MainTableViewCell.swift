//
//  MainTableViewCell.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    init(style: UITableViewCellStyle, reuseIdentifier: String?, str: String ) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.text = str
        
    }
    
    
    //修改编辑的图片
        override func layoutSubviews() {
            super.layoutSubviews()
            for control in self.subviews{
                if control.isMemberOfClass(NSClassFromString("UITableViewCellEditControl")!){
                    for v in control.subviews{
                        if(v.isKindOfClass(UIImageView)){
                            let img = v as! UIImageView
                            if(self.selected){
                                img.image = UIImage(named: "fszc_mainmap_dianzhuang.png")
                            }else{
                                img.image = UIImage(named: "fszc_daohangimage.png")
                            }
                        }
                    }
                }
            }
        }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
