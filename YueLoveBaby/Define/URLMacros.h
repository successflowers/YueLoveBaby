
//
//  URLMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h

#pragma mark ------- Secret -------
#define App_Key @"100004"
#define APP_Secret @"83af706573907c3800ffa0a53b6afd2f"
#define APP_Authorization @"coolplay-auth-v1"
#define APP_Channel @"coolplayhrcoach001"

#pragma mark ------- Server --------
#define URL_Server  @"http://srv.coolplay.tv:8086" //服务器地址


#pragma mark ------- User_LoginOrRegister -------
#define URL_User_WeiXin_Login @"/hr/login/weixin" //微信登陆
#define URL_User_Information_Modify @"/hr/user/update" //修改用户信息
#define URL_User_Information_Get @"/hr/user/info" //获取用户信息
#define URL_User_NameOrEmailBox_Login @"/hr/login/user" //用户名／邮箱登陆
#define URL_User_NameOrEmailBox_Register @"/hr/register/user" //用户名／邮箱注册
#define URL_User_NameOrEmailBox_Check @"/hr/register/valid" //检查用户名或邮箱
#define URL_User_NameOrEmailBox_Keypass_Modify @"/user/changepwd" //修改密码（根据邮箱和验证码）
#define URL_User_EmailBox_Keypass_Send @"/mail/sendcode" //发送邮箱验证码


#pragma mark ------- Business_Student -------
#define URL_Student_TeacherMumber_List @"/hr/course/coaches" //获取教练列表
#define URL_Student_TeacherNumber_Blinded_List @"/hr/course/mycoach" //获取学员临时绑定的教练
#define URL_Student_Teacher_Blinding @"/hr/course/bindcoach" //学员临时绑定教练
#define URL_Student_Teacher_Blinded_Delete @"/hr/course/unbindcoach" //学员解除与教练的绑定
#define URL_Student_HeartRate_Regist @"/hr/user/regdevice" //注册心率带
#define URL_Student_HeartRate_Number_Get @"/hr/box/hubs" //通过盒子mac获取绑定的HUB蓝牙路由器信息
#define URL_Student_MeasureNumber_Update @"/hr/user/updatemeasure" //更新用户测量数值
#define URL_Student_MeasureNumber_Get @"/hr/user/measure" //获取用户测量数值
#define URL_Student_Aim_Create @"/hr/objective/create" //创建目标
#define URL_Student_Aim_Mine @"/hr/objective/list" //我的目标
#define URL_Student_Challenge_Create @"/hr/challenge/create" //创建挑战
#define URL_Student_Challenge_Mine @"/hr/challenge/list" //我的挑战列表
#define URL_Student_Challenge_Rank @"/hr/challenge/users" //挑战的用户数据排行
#define URL_Student_Challenge_Quit @"/hr/challenge/remove" //退出挑战
#define URL_Student_SportState_Mine @"/hr/user/mystats" //获取用户的统计数据
#define URL_Student_SportState_All_List @"/hr/box/info" //获取全部用户、运动时间、健身馆等信息
#define URL_Student_Match_NoJion @"/hr/gym/challenge/new" //获取用户未参与的挑战
#define URL_Student_Match_Jion @"/hr/gym/challenge/join" //加入挑战
#define URL_Studnet_Match_Mine @"/hr/gym/challenge/my" //我加入的竞技挑战
#define URL_Student_Match_Quit @"/hr/gym/challenge/remove" //退出挑战
#define URL_Student_GroupCourse_List @"/hr/groupcourse/schedule" //根据日期获取团课排期列表


#pragma mark ------- Business_Teacher -------
#define URL_Teacher_SportData_All_Send @"/hr/box/uploaddata" //上传运动数据(全部)
#define URL_Teacher_Event_List @"/hr/box/event" //获取事件
#define URL_Teacher_Course_List @"/hr/course/box" //获取健身馆可使用的盒子列表
#define URL_Teacher_Course_Teaching @"/hr/course/valid" //获取正在进行的课程
#define URL_Teacher_Course_Student_Blinded @"/hr/course/users" //根据课程获取绑定的学员
#define URL_Teacher_Course_Student_NoBlinded @"/hr/course/validusers" //获取健身馆未绑定的会员列表
#define URL_Teacher_Course_Student_Information @"/hr/course/userinfo" //获取健身馆指定会员基本信息
#define URL_Teacher_Course_Create @"/hr/course/create" //新建课程
#define URL_Teacher_Course_Stop @"/hr/course/stop" //停止正在进行的课程
#define URL_Teacher_HeartRate_NoBlinded @"/hr/course/validdevices" //获取健身馆未绑定的心率带列表
#define URL_Teacher_HeartRate_Blinding @"/hr/course/binddevice" //绑定心率带
#define Url_Teacher_HeartRate_Blinded_Delete @"/hr/course/unbinddevice" //解绑心率带


#pragma mark ------- Friend -------
#define URL_Friend_Recommend @"/hr/friend/recommend" //推荐添加的好友
#define URL_Friend_Add @"/hr/friend/add" //添加好友
#define URL_Friend_Delete @"/hr/friend/delete" //删除好友
#define URL_Friend_Apply_Manage @"/hr/friend/accept" //处理好友申请
#define URL_Friend_List @"/hr/friend/list" //好友列表
#define URL_Friend_List_Mine @"/hr/friend/group/list" //我的好友组
#define URL_Friend_Group @"/hr/friend/group/create" //创建好友组
#define URL_Friend_Group_Users @"/hr/friend/group/users"//好友组用户
#define URL_Friend_Group_Add @"/hr/friend/group/adduser" //添加好友进组
#define URL_Friend_Group_Delete @"/hr/friend/group/removeuser" //移除组里的好友
#define URL_Friend_News_Get @"/hr/data/news" //可获取所有或某个好友动态
#define URL_Friend_Sport_Detail_Get @"/hr/data/detail" //运动详情
#define URL_Friend_Like_Chick @"/hr/data/like/add" //点赞
#define URL_Friend_Like_List @"/hr/data/like/list" //获取动态点赞用户列表
#define URL_Friend_Comment_Add @"/hr/data/comment/add" //给某条动态评论
#define URL_Friend_Comment_List @"/hr/data/comment/list" //获取动态评论列表
#define URL_Friend_SportCalendar_Get @"/hr/user/calendar" //获取某用户的运动日历
#define URL_Friend_Setting_Update @"/hr/user/setting/update" //对好友权限开关项设置，可单项修改
#define URL_Friend_Setting_Get @"/hr/user/setting/values" //获取好友权限开关项设置


#pragma mark ------- Other -------
#define URL_App_Version_Update @"/hr/box/update" //获取盒子app升级信息，启动时调用
#define URL_Ad_List @"/v2/advertising/retrieve" //广告
#define URL_Image_Send @"/file/upload/bs64" //上传图片
#define URL_SportData_Send @"/hr/data/upload" //上传运动数据
#define URL_SportBackGroundForTitleOrImage_Modif @"/hr/data/update" //更新运动标题/背景图

#endif /* URLMacros_h */
