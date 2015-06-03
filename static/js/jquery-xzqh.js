/*!
 * jock-citypicker  v2.0
 * Copyright 2012, JockChou
 * Date: Sat Feb 13 22:33:48 2010 -0500
 * Email: 164068300@qq.com
 * QQ:164068300
 */
(function(host) {
    var window = host || window,
    doc = document,
    selectedCity = "",
    popUpCityFrame = null,
    selectEventProxy = null,
    hotEventProxy = null,
    scrollEventProxy = null,
    toString = Object.prototype.toString,
     city = {
        A: [{
            name: "阿坝",
            spell: "513200"
        },
        {
            name: "阿克苏",
            spell: "652900"
        },
        {
            name: "阿拉善",
            spell: "152900"
        },
        {
            name: "阿里",
            spell: "542500"
        },
        {
            name: "阿勒泰",
            spell: "654300"
        },
        {
            name: "安康",
            spell: "610900"
        },
        {
            name: "安庆",
            spell: "340800"
        },
        {
            name: "鞍山",
            spell: "210300"
        },
        {
            name: "安顺",
            spell: "520400"
        },
        {
            name: "安阳",
            spell: "410500"
        },
        {
            name: "澳门",
            spell: "820000"
        }],
        B: [{
            name: "白城",
            spell: "220800"
        },
        {
            name: "百色",
            spell: "451000"
        },
        {
            name: "白山",
            spell: "220600"
        },
        {
            name: "白银",
            spell: "620400"
        },
        {
            name: "保定",
            spell: "130600"
        },
        {
            name: "宝鸡",
            spell: "610300"
        },
        {
            name: "保山",
            spell: "530500"
        },
        {
            name: "包头",
            spell: "150200"
        },
        {
            name: "巴彦淖尔",
            spell: "150800"
        },
        {
            name: "巴音郭楞",
            spell: "652800"
        },
        {
            name: "巴中",
            spell: "511900"
        },
        {
            name: "北海",
            spell: "450500"
        },
        {
            name: "北京",
            spell: "110000"
        },
        {
            name: "蚌埠",
            spell: "340300"
        },
        {
            name: "本溪",
            spell: "210500"
        },
        {
            name: "毕节",
            spell: "520500"
        },
        {
            name: "滨州",
            spell: "371600"
        },
        {
            name: "博尔塔拉",
            spell: "652700"
        },
        {
            name: "亳州",
            spell: "341600"
        }],
        C: [{
            name: "沧州",
            spell: "130900"
        },
        {
            name: "长春",
            spell: "220100"
        },
        {
            name: "常德",
            spell: "430700"
        },
        {
            name: "昌都",
            spell: "542100"
        },
        {
            name: "昌吉",
            spell: "652300"
        },
        {
            name: "长沙",
            spell: "430100"
        },
        {
            name: "长治",
            spell: "140400"
        },
        {
            name: "常州",
            spell: "320400"
        },/*
        {
            name: "巢湖",
            spell: "340181"
        },*/
        {
            name: "朝阳",
            spell: "211300"
        },
        {
            name: "潮州",
            spell: "445100"
        },
        {
            name: "承德",
            spell: "130800"
        },
        {
            name: "成都",
            spell: "510100"
        },
        {
            name: "郴州",
            spell: "431000"
        },
        {
            name: "赤峰",
            spell: "150400"
        },
        {
            name: "池州",
            spell: "341700"
        },
        {
            name: "重庆",
            spell: "500000"
        },
        {
            name: "崇左",
            spell: "451400"
        },
        {
            name: "楚雄",
            spell: "532300"
        },
        {
            name: "滁州",
            spell: "341100"
        }],
        D: [{
            name: "大理",
            spell: "532900"
        },
        {
            name: "大连",
            spell: "210200"
        },
        {
            name: "丹东",
            spell: "210600"
        },/*
        {
            name: "儋州",
            spell: "469003"
        },*/
        {
            name: "大庆",
            spell: "230600"
        },
        {
            name: "大同",
            spell: "140200"
        },
        {
            name: "大兴安岭",
            spell: "232700"
        },
        {
            name: "达州",
            spell: "511700"
        },
        {
            name: "德宏",
            spell: "533100"
        },
        {
            name: "德阳",
            spell: "510600"
        },
        {
            name: "德州",
            spell: "371400"
        },
        {
            name: "定西",
            spell: "621100"
        },
        {
            name: "迪庆",
            spell: "533400"
        },/*
        {
            name: "东方",
            spell: "469007"
        },*/
        {
            name: "东莞",
            spell: "441900"
        },
        {
            name: "东营",
            spell: "370500"
        }],
        E: [{
            name: "鄂尔多斯",
            spell: "150600"
        },
        {
            name: "恩施",
            spell: "422800"
        },
        {
            name: "鄂州",
            spell: "420700"
        }],
        F: [{
            name: "防城港",
            spell: "450600"
        },
        {
            name: "佛山",
            spell: "440600"
        },
        {
            name: "抚顺",
            spell: "210400"
        },
        {
            name: "阜新",
            spell: "210900"
        },
        {
            name: "阜阳",
            spell: "341200"
        },
        {
            name: "福州",
            spell: "350100"
        },
        {
            name: "抚州",
            spell: "361000"
        }],
        G: [{
            name: "甘南",
            spell: "623000"
        },
        {
            name: "赣州",
            spell: "360700"
        },
        {
            name: "甘孜",
            spell: "513300"
        },
        {
            name: "广安",
            spell: "511600"
        },
        {
            name: "广元",
            spell: "510800"
        },
        {
            name: "广州",
            spell: "440100"
        },
        {
            name: "贵港",
            spell: "450800"
        },
        {
            name: "桂林",
            spell: "450300"
        },
        {
            name: "贵阳",
            spell: "520100"
        },
        {
            name: "果洛",
            spell: "632600"
        },
        {
            name: "固原",
            spell: "640400"
        }],
        H: [{
            name: "哈尔滨",
            spell: "230100"
        },
        {
            name: "海北",
            spell: "632200"
        },
        {
            name: "海东",
            spell: "630200"
        },
        {
            name: "海口",
            spell: "460100"
        },
        {
            name: "海南",
            spell: "632500"
        },
        {
            name: "海西",
            spell: "632800"
        },
        {
            name: "哈密",
            spell: "652200"
        },
        {
            name: "邯郸",
            spell: "130400"
        },
        {
            name: "杭州",
            spell: "330100"
        },
        {
            name: "汉中",
            spell: "610700"
        },
        {
            name: "鹤壁",
            spell: "410600"
        },
        {
            name: "河池",
            spell: "451200"
        },
        {
            name: "合肥",
            spell: "340100"
        },
        {
            name: "鹤岗",
            spell: "230400"
        },
        {
            name: "黑河",
            spell: "231100"
        },
        {
            name: "衡水",
            spell: "131100"
        },
        {
            name: "衡阳",
            spell: "430400"
        },
        {
            name: "河源",
            spell: "441600"
        },
        {
            name: "菏泽",
            spell: "371700"
        },
        {
            name: "贺州",
            spell: "451100"
        },
        {
            name: "红河",
            spell: "532500"
        },
        {
            name: "和田",
            spell: "653200"
        },
        {
            name: "淮安",
            spell: "320800"
        },
        {
            name: "淮北",
            spell: "340600"
        },
        {
            name: "怀化",
            spell: "431200"
        },
        {
            name: "淮南",
            spell: "340400"
        },
        {
            name: "黄冈",
            spell: "421100"
        },
        {
            name: "黄南",
            spell: "632300"
        },
        {
            name: "黄山",
            spell: "341000"
        },
        {
            name: "黄石",
            spell: "420200"
        },
        {
            name: "呼和浩特",
            spell: "150100"
        },
        {
            name: "惠州",
            spell: "441300"
        },
        {
            name: "葫芦岛",
            spell: "211400"
        },
        {
            name: "呼伦贝尔",
            spell: "150700"
        },
        {
            name: "湖州",
            spell: "330500"
        }],
        J: [{
            name: "佳木斯",
            spell: "230800"
        },
        {
            name: "吉安",
            spell: "360800"
        },
        {
            name: "江门",
            spell: "440700"
        },
        {
            name: "焦作",
            spell: "410800"
        },
        {
            name: "嘉兴",
            spell: "330400"
        },
        {
            name: "嘉峪关",
            spell: "620200"
        },
        {
            name: "揭阳",
            spell: "445200"
        },
        {
            name: "吉林",
            spell: "220200"
        },
        {
            name: "济南",
            spell: "370100"
        },
        {
            name: "金昌",
            spell: "620300"
        },
        {
            name: "晋城",
            spell: "140500"
        },
        {
            name: "景德镇",
            spell: "360200"
        },
        {
            name: "荆门",
            spell: "420800"
        },
        {
            name: "荆州",
            spell: "421000"
        },
        {
            name: "金华",
            spell: "330700"
        },
        {
            name: "济宁",
            spell: "370800"
        },
        {
            name: "晋中",
            spell: "140700"
        },
        {
            name: "锦州",
            spell: "210700"
        },
        {
            name: "九江",
            spell: "360400"
        },
        {
            name: "酒泉",
            spell: "620900"
        },
        {
            name: "鸡西",
            spell: "230300"
        }/*,
        {
            name: "济源",
            spell: "419001"
        }*/],
        K: [{
            name: "开封",
            spell: "410200"
        },
        {
            name: "克拉玛依",
            spell: "650200"
        },
        {
            name: "喀什",
            spell: "653100"
        },
        {
            name: "克州",
            spell: "653000"
        },
        {
            name: "昆明",
            spell: "530100"
        }],
        L: [{
            name: "来宾",
            spell: "451300"
        },
        {
            name: "莱芜",
            spell: "371200"
        },
        {
            name: "廊坊",
            spell: "131000"
        },
        {
            name: "兰州",
            spell: "620100"
        },
        {
            name: "拉萨",
            spell: "540100"
        },
        {
            name: "乐山",
            spell: "511100"
        },
        {
            name: "凉山",
            spell: "513400"
        },
        {
            name: "连云港",
            spell: "320700"
        },
        {
            name: "聊城",
            spell: "371500"
        },
        {
            name: "辽阳",
            spell: "211000"
        },
        {
            name: "辽源",
            spell: "220400"
        },
        {
            name: "丽江",
            spell: "530700"
        },
        {
            name: "临沧",
            spell: "530900"
        },
        {
            name: "临汾",
            spell: "141000"
        },
        {
            name: "临夏",
            spell: "622900"
        },
        {
            name: "临沂",
            spell: "371300"
        },
        {
            name: "林芝",
            spell: "542600"
        },
        {
            name: "丽水",
            spell: "331100"
        },
        {
            name: "六安",
            spell: "341500"
        },
        {
            name: "六盘水",
            spell: "520200"
        },
        {
            name: "柳州",
            spell: "450200"
        },
        {
            name: "陇南",
            spell: "621200"
        },
        {
            name: "龙岩",
            spell: "350800"
        },
        {
            name: "娄底",
            spell: "431300"
        },
        {
            name: "漯河",
            spell: "411100"
        },
        {
            name: "洛阳",
            spell: "410300"
        },
        {
            name: "泸州",
            spell: "510500"
        },
        {
            name: "吕梁",
            spell: "141100"
        }],
        M: [{
            name: "马鞍山",
            spell: "340500"
        },
        {
            name: "茂名",
            spell: "440900"
        },
        {
            name: "眉山",
            spell: "511400"
        },
        {
            name: "梅州",
            spell: "441400"
        },
        {
            name: "绵阳",
            spell: "510700"
        },
        {
            name: "牡丹江",
            spell: "231000"
        }],
        N: [{
            name: "南昌",
            spell: "360100"
        },
        {
            name: "南充",
            spell: "511300"
        },
        {
            name: "南京",
            spell: "320100"
        },
        {
            name: "南宁",
            spell: "450100"
        },
        {
            name: "南平",
            spell: "350700"
        },
        {
            name: "南通",
            spell: "320600"
        },
        {
            name: "南阳",
            spell: "411300"
        },
        {
            name: "那曲",
            spell: "542400"
        },
        {
            name: "内江",
            spell: "511000"
        },
        {
            name: "宁波",
            spell: "330200"
        },
        {
            name: "宁德",
            spell: "350900"
        },
        {
            name: "怒江",
            spell: "533300"
        }],
        P: [{
            name: "盘锦",
            spell: "211100"
        },
        {
            name: "攀枝花",
            spell: "510400"
        },
        {
            name: "平顶山",
            spell: "410400"
        },
        {
            name: "平凉",
            spell: "620800"
        },
        {
            name: "萍乡",
            spell: "360300"
        },
        {
            name: "普洱",
            spell: "530800"
        },
        {
            name: "莆田",
            spell: "350300"
        },
        {
            name: "濮阳",
            spell: "410900"
        }],
        Q: [{
            name: "黔东南",
            spell: "522600"
        },/*
        {
            name: "潜江",
            spell: "429005"
        },*/
        {
            name: "黔南",
            spell: "522700"
        },
        {
            name: "黔西南",
            spell: "522300"
        },
        {
            name: "青岛",
            spell: "370200"
        },
        {
            name: "庆阳",
            spell: "621000"
        },
        {
            name: "清远",
            spell: "441800"
        },
        {
            name: "秦皇岛",
            spell: "130300"
        },
        {
            name: "钦州",
            spell: "450700"
        },/*
        {
            name: "琼海",
            spell: "469002"
        },*/
        {
            name: "齐齐哈尔",
            spell: "230200"
        },
        {
            name: "七台河",
            spell: "230900"
        },
        {
            name: "泉州",
            spell: "350500"
        },
        {
            name: "曲靖",
            spell: "530300"
        },
        {
            name: "衢州",
            spell: "330800"
        }],
        R: [{
            name: "日照",
            spell: "371100"
        }],
        S: [{
            name: "三门峡",
            spell: "411200"
        },
        {
            name: "三明",
            spell: "350400"
        },
        {
            name: "三亚",
            spell: "460200"
        },
        {
            name: "上海",
            spell: "310000"
        },
        {
            name: "商洛",
            spell: "611000"
        },
        {
            name: "商丘",
            spell: "411400"
        },
        {
            name: "上饶",
            spell: "361100"
        },
        {
            name: "山南",
            spell: "542200"
        },
        {
            name: "汕头",
            spell: "440500"
        },
        {
            name: "汕尾",
            spell: "441500"
        },
        {
            name: "韶关",
            spell: "440200"
        },
        {
            name: "绍兴",
            spell: "330600"
        },
        {
            name: "邵阳",
            spell: "430500"
        },/*
        {
            name: "神农架",
            spell: "429021"
        },*/
        {
            name: "沈阳",
            spell: "210100"
        },
        {
            name: "深圳",
            spell: "440300"
        },
        {
            name: "石河子",
            spell: "659000"
        },
        {
            name: "石家庄",
            spell: "130100"
        },
        {
            name: "十堰",
            spell: "420300"
        },
        {
            name: "石嘴山",
            spell: "640200"
        },
        {
            name: "双鸭山",
            spell: "230500"
        },
        {
            name: "朔州",
            spell: "140600"
        },
        {
            name: "四平",
            spell: "220300"
        },
        {
            name: "松原",
            spell: "220700"
        },
        {
            name: "绥化",
            spell: "231200"
        },
        {
            name: "遂宁",
            spell: "510900"
        },
        {
            name: "随州",
            spell: "421300"
        },
        {
            name: "宿迁",
            spell: "321300"
        },
        {
            name: "苏州",
            spell: "320500"
        },
        {
            name: "宿州",
            spell: "341300"
        }],
        T: [{
            name: "塔城",
            spell: "654200"
        },
        {
            name: "泰安",
            spell: "370900"
        },/* 
        {
            name: "台北",
            spell: "taibei"
        }, */
        {
            name: "太原",
            spell: "140100"
        },
        {
            name: "台州",
            spell: "331000"
        },
        {
            name: "泰州",
            spell: "321200"
        },
        {
            name: "唐山",
            spell: "130200"
        },
        {
            name: "天津",
            spell: "120000"
        },/*
        {
            name: "天门",
            spell: "429006"
        },*/
        {
            name: "天水",
            spell: "620500"
        },
        {
            name: "铁岭",
            spell: "211200"
        },
        {
            name: "铜川",
            spell: "610200"
        },
        {
            name: "通化",
            spell: "220500"
        },
        {
            name: "通辽",
            spell: "150500"
        },
        {
            name: "铜陵",
            spell: "340700"
        },
        {
            name: "铜仁",
            spell: "520600"
        },
        {
            name: "吐鲁番",
            spell: "652100"
        }],
        W: [{/*
            name: "万宁",
            spell: "469006"
        },
        {*/
            name: "潍坊",
            spell: "370700"
        },
        {
            name: "威海",
            spell: "371000"
        },
        {
            name: "渭南",
            spell: "610500"
        },/*
        {
            name: "文昌",
            spell: "469005"
        },*/
        {
            name: "文山",
            spell: "532600"
        },
        {
            name: "温州",
            spell: "330300"
        },
        {
            name: "乌海",
            spell: "150300"
        },
        {
            name: "武汉",
            spell: "420100"
        },
        {
            name: "芜湖",
            spell: "340200"
        },
        {
            name: "乌兰察布",
            spell: "150900"
        },
        {
            name: "乌鲁木齐",
            spell: "650100"
        },
        {
            name: "武威",
            spell: "620600"
        },
        {
            name: "无锡",
            spell: "320200"
        },/*
        {
            name: "五指山",
            spell: "469001"
        },*/
        {
            name: "吴忠",
            spell: "640300"
        },
        {
            name: "梧州",
            spell: "450400"
        }],
        X: [{
            name: "厦门",
            spell: "350200"
        },
        {
            name: "西安",
            spell: "610100"
        },
        {
            name: "香港",
            spell: "810000"
        },
        {
            name: "湘潭",
            spell: "430300"
        },
        {
            name: "湘西",
            spell: "433100"
        },
        {
            name: "襄阳",
            spell: "420600"
        },
        {
            name: "咸宁",
            spell: "421200"
        },
        {
            name: "仙桃",
            spell: "429000"
        },
        {
            name: "咸阳",
            spell: "610400"
        },
        {
            name: "孝感",
            spell: "420900"
        },
        {
            name: "日喀则",
            spell: "542300"
        },
        {
            name: "锡林郭勒",
            spell: "152500"
        },
        {
            name: "兴安",
            spell: "230400"
        },
        {
            name: "邢台",
            spell: "130500"
        },
        {
            name: "西宁",
            spell: "630100"
        },
        {
            name: "新乡",
            spell: "410700"
        },
        {
            name: "信阳",
            spell: "411500"
        },
        {
            name: "新余",
            spell: "360500"
        },
        {
            name: "忻州",
            spell: "140900"
        },
        {
            name: "西双版纳",
            spell: "532800"
        },
        {
            name: "宣城",
            spell: "341800"
        },
        {
            name: "许昌",
            spell: "411000"
        },
        {
            name: "徐州",
            spell: "320300"
        }],
        Y: [{
            name: "雅安",
            spell: "511800"
        },
        {
            name: "延安",
            spell: "610600"
        },
        {
            name: "延边",
            spell: "222400"
        },
        {
            name: "盐城",
            spell: "320900"
        },
        {
            name: "阳江",
            spell: "441700"
        },
        {
            name: "阳泉",
            spell: "140300"
        },
        {
            name: "扬州",
            spell: "321000"
        },
        {
            name: "烟台",
            spell: "370600"
        },
        {
            name: "宜宾",
            spell: "511500"
        },
        {
            name: "宜昌",
            spell: "420500"
        },
        {
            name: "宜春",
            spell: "360900"
        },
        {
            name: "伊春",
            spell: "230700"
        },
        {
            name: "伊犁",
            spell: "654000"
        },
        {
            name: "银川",
            spell: "640100"
        },
        {
            name: "营口",
            spell: "210800"
        },
        {
            name: "鹰潭",
            spell: "360600"
        },
        {
            name: "益阳",
            spell: "430900"
        },
        {
            name: "永州",
            spell: "431100"
        },
        {
            name: "岳阳",
            spell: "430600"
        },
        {
            name: "玉林",
            spell: "450900"
        },
        {
            name: "榆林",
            spell: "610800"
        },
        {
            name: "运城",
            spell: "140800"
        },
        {
            name: "云浮",
            spell: "445300"
        },
        {
            name: "玉树",
            spell: "632700"
        },
        {
            name: "玉溪",
            spell: "530400"
        }],
        Z: [{
            name: "枣庄",
            spell: "370400"
        },
        {
            name: "张家界",
            spell: "430800"
        },
        {
            name: "张家口",
            spell: "130700"
        },
        {
            name: "张掖",
            spell: "620700"
        },
        {
            name: "漳州",
            spell: "350600"
        },
        {
            name: "湛江",
            spell: "440800"
        },
        {
            name: "肇庆",
            spell: "441200"
        },
        {
            name: "昭通",
            spell: "530600"
        },
        {
            name: "郑州",
            spell: "410100"
        },
        {
            name: "镇江",
            spell: "321100"
        },
        {
            name: "中山",
            spell: "442000"
        },
        {
            name: "中卫",
            spell: "640500"
        },
        {
            name: "周口",
            spell: "411600"
        },
        {
            name: "舟山",
            spell: "330900"
        },
        {
            name: "珠海",
            spell: "440400"
        },
        {
            name: "驻马店",
            spell: "411700"
        },
        {
            name: "株洲",
            spell: "430200"
        },
        {
            name: "淄博",
            spell: "370300"
        },
        {
            name: "自贡",
            spell: "510300"
        },
        {
            name: "资阳",
            spell: "512000"
        },
        {
            name: "遵义",
            spell: "520300"
        }]
    },
    hotCity = [{
        name: "北京",
        spell: "110000"
    },
    {
        name: "上海",
        spell: "310000"
    },
    {
        name: "广州",
        spell: "440100"
    },
    {
        name: "深圳",
        spell: "440300"
    },
    {
        name: "成都",
        spell: "510100"
    },
    {
        name: "重庆",
        spell: "500000"
    },
    {
        name: "福州",
        spell: "350100"
    },
    {
        name: "厦门",
        spell: "350200"
    },
    {
        name: "杭州",
        spell: "330100"
    },
    {
        name: "武汉",
        spell: "420100"
    }],
    KEY = ["A", "B", "C", "D", "E", "F", "G", "H", "", "J", "K", "L", "M", "N", "", "P", "Q", "R", "S", "T", "", "", "W", "X", "Y", "Z"],
    ID = {
        cityFrame: "div_select_city_sub_menu",
        cityList: "div_city_list"
    },
    CLAZZ = {
        cityFrame: "mod_list_city",
        cityTop: "city_top",
        cityList: "list_wrap",
        cityHot: "hot",
        cityCont: "city_cont",
        col1: "col1",
        col2: "col2",
        table: "mod_city_list"
    };
    function createCityTopHtml() {
        var fragment = doc.createDocumentFragment(),
        strong = doc.createElement("strong"),
        txt1 = doc.createTextNode("1213"),
        txt2 = doc.createTextNode("全部"),
        p = doc.createElement("p"),
        a = doc.createElement("a");
        strong.appendChild(txt1);
        a.href = "javascript:void(0)";
        a.appendChild(txt2);
        p.appendChild(a);
        for (var row in city) {
            if (city.hasOwnProperty(row)) {
                a = doc.createElement("a");
                a.href = "#" + row;
                a.appendChild(doc.createTextNode(row));
                p.appendChild(a);
            }
        }
        fragment.appendChild(strong);
        fragment.appendChild(p);
        return fragment;
    }
    function createHotCityHtml() {
        var fragment = doc.createDocumentFragment(),
        strong = doc.createElement("strong"),
        txt = doc.createTextNode("热门城市："),
        currentCity = null,
        cityText = "",
        link = null;
        strong.appendChild(txt);
        fragment.appendChild(strong);
        for (var i = 0,
        len = hotCity.length; i < len; i++) {
            currentCity = hotCity[i];
            link = doc.createElement("a");
            link.href = currentCity.spell;
            cityText = doc.createTextNode(currentCity.name);
            link.appendChild(cityText);
            link.title = currentCity.name;
            fragment.appendChild(link);
        }
        return fragment;
    }
    function createCityTRHtml() {
        var fragment = doc.createDocumentFragment();
        for (var miao in city) {
            if (city.hasOwnProperty(miao)) {
                var tr = doc.createElement("tr"),
                th = doc.createElement("th"),
                td = doc.createElement("td"),
                span = doc.createElement("span"),
                text = doc.createTextNode(miao),
                miaoArray = city[miao],
                currentMiao = null,
                a = null;
                for (var j = 0,
                len = miaoArray.length; j < len; j++) {
                    currentMiao = miaoArray[j];
                    a = doc.createElement("a");
                    a.title = currentMiao.name;
                    a.href = currentMiao.spell;
                    a.appendChild(doc.createTextNode(currentMiao.name));
                    td.appendChild(a);
                }
                span.appendChild(text);
                th.appendChild(span);
                tr.id = "miao_" + miao;
                tr.appendChild(th);
                tr.appendChild(td);
                fragment.appendChild(tr);
            }
        }
        return fragment;
    }
    function createCityContentHtml() {
        var fragment = doc.createDocumentFragment(),
        h4 = doc.createElement("h4"),
        table = doc.createElement("table"),
        colgroup = doc.createElement("colgroup"),
        tbody = doc.createElement("tbody"),
        col1 = doc.createElement("col"),
        col2 = doc.createElement("col"),
        h4Text = doc.createTextNode("全部城市："),
        trHtml = createCityTRHtml();
        table.className = CLAZZ.table;
        col1.className = CLAZZ.col1;
        col2.className = CLAZZ.col2;
        colgroup.appendChild(col1);
        colgroup.appendChild(col2);
        h4.appendChild(h4Text);
        tbody.appendChild(trHtml);
        table.appendChild(colgroup);
        table.appendChild(tbody);
        selectEventProxy = table;
        fragment.appendChild(h4);
        fragment.appendChild(table);
        return fragment;
    }
    function stopPropagation(event) {
        if (event.stopPropagation) {
            event.stopPropagation();
        } else {
            event.cancelBubble = true;
        }
    }
    function preventDefault(event) {
        if (event.preventDefault) {
            event.preventDefault();
        } else {
            event.returnValue = false;
        }
    }
    function cityScroll(m) {
        if (m && typeof m === "string") {
            m = m.toUpperCase();
            if (doc.all) {
                var cityListDiv = doc.getElementById(ID.cityList),
                tr = doc.getElementById("miao_" + m);
                if (tr !== null) {
                    cityListDiv.scrollTop = tr.offsetTop + 32;
                }
            } else {
                var miao = doc.getElementById("miao_" + m);
                if (miao !== null) {
                    miao.scrollIntoView();
                }
            }
        }
    }
    function addSelectEvent(proxyTag, type, callback) {
        proxyTag["on" + type] = function(e) {
            var event = e || window.event,
            target = event.srcElement || event.target;
            if (target.tagName.toLowerCase() == "a") {
            	  var data = {};
            	  data.mc = target.innerHTML;
            	  data.dm   = target.getAttribute("href");
                selectedCity = data;//.innerHTML     
                callback(selectedCity);
            }
            citypicker.close();
            stopPropagation(event);
            preventDefault(event);
        };
    }
    function addScrollEvent(proxyTag, type) {
        proxyTag["on" + type] = function(e) {
            var event = e || window.event,
            target = event.srcElement || event.target;
            if (target.tagName.toLowerCase() == "a") {
                var m = target.getAttribute("href").replace(/^#/, "") || "A";
                cityScroll(m);
            }
            stopPropagation(event);
            preventDefault(event);
        };
    }
    function addKeyPressEvent(tag) {
        tag.onkeypress = function(e) {
            var event = window.event || e,
            charCode, keyIndex = 0,
            keyCode;
            if (typeof event.charCode == "number") {
                charCode = event.charCode;
            } else {
                charCode = event.keyCode;
            }
            if (charCode >= 97 && charCode <= 122) {
                keyIndex = charCode - 97;
            } else if (charCode >= 65 && charCode <= 90) {
                keyIndex = charCode - 65;
            }
            keyCode = KEY[keyIndex];
            cityScroll(keyCode);
        };
    }
    function createFrame() {
        var cityFrame = doc.createElement("div"),
        cityTop = doc.createElement("div"),
        cityHot = doc.createElement("p"),
        cityList = doc.createElement("div"),
        cityCont = doc.createElement("div"),
        hotCityHtml = createHotCityHtml(),
        cityContentHtml = createCityContentHtml(),
        cityTopHtml = createCityTopHtml();
        addKeyPressEvent(cityFrame);
        hotEventProxy = cityHot;
        scrollEventProxy = cityTop;
        popUpCityFrame = cityFrame;
        cityFrame.id = ID.cityFrame;
        cityFrame.className = CLAZZ.cityFrame;
        cityTop.className = CLAZZ.cityTop;
        cityHot.className = CLAZZ.cityHot;
        cityList.id = ID.cityList;
        cityList.className = CLAZZ.cityList;
        cityCont.className = CLAZZ.cityCont;
        cityHot.appendChild(hotCityHtml);
        cityCont.appendChild(cityContentHtml);
        cityTop.appendChild(cityTopHtml);
        cityList.appendChild(cityCont);
        cityFrame.appendChild(cityTop);
        cityFrame.appendChild(cityHot);
        cityFrame.appendChild(cityList);
        return cityFrame;
    }
    var citypicker = {
        version: "2.0",
        point: {
            left: 0,
            top: 0
        },
        callback: function() {},
        show: function() {
            var lenght = arguments.length,
            options, point = citypicker.point,
            callback = citypicker.callback;
            if (lenght == 2) {
                point = arguments[0];
                callback = arguments[1];
            } else {
                options = arguments[0];
                if (options && typeof options == "object") {
                    point.left = options.left || citypicker.point;
                    point.top = options.top || citypicker.top;
                    callback = options.selected || citypicker.callback;
                }
            }
            var docCityFrame = doc.getElementById(ID.cityFrame);
            if (!popUpCityFrame || !docCityFrame) {
                popUpCityFrame = createFrame();
                addScrollEvent(scrollEventProxy, "click");
                addKeyPressEvent(doc);
                doc.body.appendChild(popUpCityFrame);
            }
            citypicker.fix(point);
            citypicker.bind(callback);
            popUpCityFrame.style.display = "block";
            return this;
        },
        close: function() {
            if (popUpCityFrame) {
                popUpCityFrame.style.display = "none";
            }
        },
        getSelectedCity: function() {
            return selectedCity;
        },
        fix: function(point) {
            if (point && typeof point === "object") {
                var left = parseInt(point.left, 10) || 0,
                top = parseInt(point.top, 10) || 0;
                citypicker.point = {
                    left: left,
                    top: top
                };
                if (popUpCityFrame) {
                    popUpCityFrame.style.left = left + "px";
                    popUpCityFrame.style.top = top + "px";
                }
            }
            return this;
        },
        bind: function(callback) {
            if (toString.call(callback) === "[object Function]") {
                citypicker.callback = callback;
                if (popUpCityFrame !== null) {
                    addSelectEvent(selectEventProxy, "click", callback);
                    addSelectEvent(hotEventProxy, "click", callback);
                }
            }
            return this;
        }
    };
    window.citypicker = citypicker;
})(window);