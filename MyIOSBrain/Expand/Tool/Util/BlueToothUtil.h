//
//  BlueToothUtil.h
//  MyIOSBrain
//
//  Created by OKAR OU on 16/8/4.
//  Copyright © 2016年 OkarOu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>


#define MyPeripheralName @"MyPeripheralName"
#define MySUUID @"XXXX"
#define MyCUUID @"XXXX"

#define kNotificationConnected @"kNotificationConnected"
#define kNotificationDisconnected @"kNotificationDisconnected"

/**
 *
 *  这个蓝牙工具类是来自： https://github.com/luoxubin/BlueTooth4.0 ， 但是我觉得名字应该叫Util比较好，所以改了一下，Code版权归luoxubin所有，谢谢
 */
typedef enum _EN_Command_Type
{
    EN_Command_Invalid = -1,
    EN_Command_Start = 0x0,
    EN_Command_Mode1 = 0x1,
    EN_Command_Mode2,
    EN_Command_Mode3,
    EN_Command_Mode4,
    EN_Command_Mode5,
    EN_Command_Mode6,
    EN_Command_Mode7,
    EN_Command_Mode8,
    EN_Command_Mode9,
    EN_Command_Stop,
    EN_Command_Shutdown,//关机
}EN_CommandType;



@interface BlueToothUtil : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate>


@property (nonatomic,assign)BOOL bluetoothPowerOn;

/**
 *  单例方法
 *
 *  @return 单例
 */
+(BlueToothUtil *)shareInstance;

/**
 *  开始扫描
 */
-(void)startScan;

/**
 *  停止扫描
 */
-(void)stopScan;


/**
 *  连接
 */
-(void)startconnect;

/**
 *  取消连接
 */
-(void)cancelConnect;


/**
 *  向设备写数据
 */
-(BOOL)writeData:(NSData*)data;

/**
 *  是否可以准备好写数据
 *
 *  @return 是否可以准备好写数据
 */
-(BOOL)isReady;

/**
 *  发送命令
 *
 *  @param command 命令内容
 *
 *  @return 是否发送成功
 */
-(BOOL)sendCommand:(EN_CommandType)command;


@end