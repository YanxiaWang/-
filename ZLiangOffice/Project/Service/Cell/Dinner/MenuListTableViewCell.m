//
//  MenuListTableViewCell.m
//  ZLiangOffice
//
//  Created by wangyanxia on 2016/11/7.
//  Copyright © 2016年 中粮. All rights reserved.
//

#import "MenuListTableViewCell.h"

@implementation MenuListTableViewCell
{
    UILabel   *_titleLable;  //标题
    UILabel   *_contextLable; //类容
    UIImageView *_pushImageView;// 箭头
    UIImageView *_numberImageView;// 数量
    UIButton   *_addButton;  //添加
    UIButton   *_subtractButton; //减少
    UILabel     *_workOff ;  //售出数量
    UIView     *_backView;
    int  _speed;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self  initView];
    }
    return self;
}
-(void)initView{
    
    //分割线
    UIView  *lineView=[[UIView alloc]initWithFrame:CGRectMake(AutoWidth(10), 0, APP_FRAME_W-AutoWidth(20), 1)];
    lineView.backgroundColor=UB_RGBAS(229);
    [self addSubview:lineView];
    
    //左边图片
    UIImageView * picImgVIew = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoHeight(10), AutoHeight(90), AutoHeight(90))];
    picImgVIew.image = [UIImage imageNamed:@"niuroupisa"];
    picImgVIew.layer.cornerRadius = 3;
    [self addSubview:picImgVIew];
    
    //标题
    _titleLable=[[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10)+picImgVIew.right, picImgVIew.top, APP_FRAME_W-AutoWidth(20)-picImgVIew.right, AutoHeight(30))];
    _titleLable.text = @"黑橄榄至尊披萨";
    _titleLable.font=UB_S_FONT(15);
    _titleLable.textColor=UB_RGBAS(53);
    [self addSubview:_titleLable];
    
    //类容
    _contextLable=[[UILabel alloc]init];
    _contextLable.frame = CGRectMake(_titleLable.left, _titleLable.bottom, _titleLable.width, AutoHeight(16));
    _contextLable.font=UB_S_FONT(13);
    _contextLable.textColor=UB_RGBAS(153);
    _contextLable.text = @"意大利经典美味";
    _contextLable.textAlignment=NSTextAlignmentLeft;
    [self addSubview:_contextLable];
    
    //价格
    UILabel * priceLabel=[[UILabel alloc]init];
    priceLabel.frame = CGRectMake(_titleLable.left, AutoHeight(74), _titleLable.width-AutoWidth(150), AutoHeight(23));
    priceLabel.font=UB_S_FONT(14);
    priceLabel.textColor=[UIColor redColor];
    priceLabel.text = @"￥100";
    priceLabel.textAlignment=NSTextAlignmentLeft;
    [self addSubview:priceLabel];
    
    
    _numberImageView=[[UIImageView alloc]initWithFrame:CGRectMake(APP_FRAME_W-AutoWidth(107), AutoHeight(74), AutoWidth(94), AutoHeight(24))];
    _numberImageView.image=[UIImage imageNamed:@"shuliang"];
    [self addSubview:_numberImageView];
    
    //加
    _addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"addbutton"] forState:UIControlStateNormal];
    _addButton.frame=CGRectMake(_numberImageView.left, _numberImageView.top, AutoWidth(30), AutoHeight(24));
    [_addButton  addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addButton];
    //减
    _subtractButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_subtractButton setImage:[UIImage imageNamed:@"menubutton"] forState:UIControlStateNormal];
    _subtractButton.frame=CGRectMake(_addButton.left+AutoWidth(64), _numberImageView.top, AutoWidth(30), AutoHeight(24));

    [_subtractButton  addTarget:self action:@selector(subtractClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_subtractButton];
    
    //个数
    _workOff=[[UILabel alloc]init];
    _workOff.frame=CGRectMake(_addButton.right, _addButton.top, AutoWidth(33), AutoHeight(24));
    _workOff.font=UB_S_FONT(11);
    _workOff.textColor=[UIColor blackColor];
    _workOff.text = @"3";
    _workOff.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_workOff];

    
}

//-(void)layoutSubviews{
//    
//    _titleLable.text=self.titleStr;
//    
//    if (self.status==1){
//        _speed=[_contextStr  intValue];
//        
//        _workOff.text=[NSString stringWithFormat:@"%@kg",_contextStr];
//        [_backView addSubview:_numberImageView];
//        [_backView addSubview:_addButton];
//        [_backView addSubview:_subtractButton];
//        [_backView addSubview:_workOff];
//    }else if(self.status==2){
//        _pushImageView.frame=CGRectMake(KWidth-20, 11.5, 10, 17);
//        [_backView addSubview:_pushImageView];
//        _contextLable.frame=CGRectMake(0, 10, KWidth-40, 20);
//        _contextLable.text=self.contextStr;
//        [_backView  addSubview:_contextLable];
//    }else if(self.status== 3){
//        _contextLable.frame=CGRectMake(0, 10, KWidth-10, 20);
//        _contextLable.text=self.contextStr;
//        _contextLable.textColor = COLOR_PRICE;
//        // 设置指定字符串的颜色值
//        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:_contextLable.text];
//        // 指定颜色与字体
//        [attributedStr addAttribute:NSForegroundColorAttributeName
//                              value:[UIColor grayColor]
//                              range:[_contextLable.text rangeOfString:@"合计:"]];
//        // 设置修改后的文本
//        _contextLable.attributedText = attributedStr;
//        [_backView  addSubview:_contextLable];
//    }else{
//        
//        _contextLable.frame=CGRectMake(0, 10, KWidth-10, 20);
//        _contextLable.text=self.contextStr;
//        [_backView  addSubview:_contextLable];
//    }
//}
//加
-(void)addClick{
    _speed++;
    _workOff.text=[NSString stringWithFormat:@"%dkg",_speed];
    
}
//减
-(void)subtractClick{
    
    if (_speed==0) {
//        SHOW_ALERTT(@"对不起 不能小于0");
        return;
    }
    _speed--;
    _workOff.text=[NSString stringWithFormat:@"%dkg",_speed];
    
}

@end
