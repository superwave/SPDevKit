//
//  SPRandomGenerator.m
//  SPDevKit
//
//  Created by Aotter on 2015/10/21.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import "SPRandomGenerator.h"
#define EnS @"abcdefghijklmnopqrstuvwxyz"
#define EnC @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#define Num @"0123456789"
#define EN EnS EnC
#define Str EnS EnC Num
#define Chr @"的一是在不了有和人這中大為上個國我以要他時來用們生到作地于出就分對成會可主發年動同工也能下過子說產種面而方後多定行學法所民得經十三之進著等部度家電力裡如水化高自二理起小物現實加量都兩體制機當使點從業本去把性好應開它合還因由其些然前外天政四日那社義事平形相全表間樣與關各重新線內數正心反你明 看原又麼利比或但質氣第向道命此變條只沒結解問意建月公無系軍很情者最立代想已通並提直題黨程展五果料象員革位入常文總次品式活設及管特件求老頭基資邊流路級少圖山統接知較長將組見計別她手角期根論運農指幾九區強放決西被幹做必戰先回則任取據處隊南給色光門即保治北造百規熱領七海地口東導器壓志世金增爭 濟階油思術極交受聯什認六共權收證改清已美再採轉更單風切打白教速花帶安場身車例真務具萬每目至達走積示議聲報鬥完類八離華名確才科張信馬節話米整空元況今集溫傳土許步群廣石記需段研界拉林律叫且究觀越織裝影算低持音眾書布復容兒須際商非驗連斷深難近礦千周委素技備半辦青省列習約支般史感勞便團往酸歷市 克何除消構府稱太準精值號率族維劃選標寫存候毛親快效斯院查江型眼王按格養易置派層片始卻專狀育廠京識適屬圓包火住調滿縣局照參紅細引聽該鐵價嚴首底液官德調隨病蘇失爾死講配女黃推顯談罪神藝呢席含企望密批營項防舉球英氧勢告李台落木幫輪破亞師圍注遠字材排供河態封另施減樹溶怎止案言士均武固葉魚波視僅費 緊愛左章早朝害續輕服試食充兵源判護司足某練差致板田降黑犯負擊範繼興似餘堅曲輸修的故城夫夠送筆船佔右財吃富春職覺漢畫功巴跟雖雜飛檢吸助昇陽互初創抗考投壞策古徑換未跑留鋼曾端責站簡述錢副盡帝射草衝承獨令限阿宣環雙請超微讓控州良軸找否紀益依優頂礎載倒房突坐粉敵略客袁冷勝絕析塊劑測絲協重訴念陳仍 羅鹽友洋錯苦夜刑移頻逐靠混母短皮終聚汽村雲哪既距衛停烈央察燒行迅境若印洲刻括激孔搞甚室待核校散侵吧甲遊久菜味舊模湖貨損預阻毫普穩乙媽植息擴銀語揮酒守拿序紙醫缺雨嗎針劉啊急唱誤訓願審附獲茶鮮糧斤孩脫硫肥善龍演父漸血歡械掌歌沙著剛攻謂盾討晚粒亂燃矛乎殺藥魯貴鐘煤讀班伯香介迫句豐培握蘭擔弦蛋 沉假穿執答樂誰順煙縮徵臉喜松腳困異免背星福買染井概慢怕磁倍祖皇促靜補評翻肉踐尼衣寬揚棉希傷操垂秋宜氫套筆督振架亮末憲慶編牛觸映雷銷詩座居抓裂胞呼娘景威綠晶厚盟衡雞孫延危膠還屋鄉臨陸顧掉呀燈歲措束耐劇玉趙跳哥季課凱胡額款紹卷齊偉蒸殖永宗苗川爐岩弱零楊奏沿露桿探滑鎮飯濃航懷趕庫奪伊靈稅了途滅 賽歸召鼓播盤裁險康唯錄菌純藉糖蓋橫符私努堂域槍潤幅哈竟熟蟲澤腦壤碳歐遍側寨敢徹慮斜薄庭都納彈飼伸折麥濕暗荷瓦塞床築惡戶訪塔奇透梁刀旋跡卡氯遇份毒泥退洗擺灰彩賣耗夏擇忙銅獻硬予繁圈雪函亦抽篇陣陰丁尺追堆雄迎泛爸樓避謀噸野豬旗累偏典館索秦脂潮爺豆忽托驚塑遺愈朱替纖粗傾尚痛楚謝奮購磨君池旁碎骨 監捕弟暴割貫殊釋詞亡壁頓寶午塵聞揭砲殘冬橋婦警綜招吳付浮遭徐您搖谷贊箱隔訂男吹樂園紛唐敗宋玻巨耕坦榮閉灣鍵凡駐鍋救恩剝凝鹼齒截煉麻紡禁廢盛版緩淨睛昌婚涉筒嘴插岸朗莊街藏姑貿腐奴啦慣乘夥恢勻紗扎辯耳彪臣億璃抵脈秀薩俄網舞店噴縱寸汗掛洪著賀閃柬爆烯津稻牆軟勇像滾釐蒙芳肯坡柱盪腿儀旅尾軋冰貢登 黎削鑽勒逃障氨郭峰幣港伏軌畝畢擦莫刺浪秘援株健售股島甘泡睡童鑄湯閥休匯舍牧繞炸哲"


@implementation SPRandomGenerator

+(NSString *)randomEngWithLength:(int)len hasCapital:(BOOL)hasCapital{
    NSString *base;
    if(hasCapital)
        base = [NSString stringWithFormat:@"%@%@",EnS,EnC];
    else
        base = EnS;
    return [self generateRandomStringWithBase:base length:len];
}
+(NSString *)randomChrWithLength:(int)len hasCapital:(BOOL)hasCapital{
    NSString *base;
    if(hasCapital)
        base = [NSString stringWithFormat:@"%@%@%@",EnS,EnC,Num];
    else
        base = [NSString stringWithFormat:@"%@%@",EnS,Num];
    return [self generateRandomStringWithBase:base length:len];
}
+(NSString *)randomZhWithLength:(int)len{
    return [self generateRandomStringWithBase:Chr length:len];
}


+(NSString *)generateRandomStringWithBase:(NSString *)base length:(int)len{
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [base characterAtIndex: arc4random_uniform((int)[base length])]];
    }
    return randomString;
}
+(NSString *)randomImageUrl:(int)width :(int)height{
    return [NSString stringWithFormat:@"http://lorempixel.com/%d/%d",width,height];
}

@end
