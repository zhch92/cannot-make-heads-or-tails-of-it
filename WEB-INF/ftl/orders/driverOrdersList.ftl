<#compress>
    <#escape x as x?html>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
            <meta charset="UTF-8">
            <title>个人中心 -货管家</title>
            <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
            <link rel="stylesheet" href="http://192.168.2.50/statics/css/style.css">
            <script type="text/javascript" src="http://192.168.2.50/statics/js/laydate.js"></script>
            <script type="text/javascript" src="http://192.168.2.50/statics/js/jquery.js"></script>
            <script>
            var _hmt = _hmt || [];
            (function() {
                var hm = document.createElement("script");
                hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
            </script>
        </head>

        <body>
            <#include "common/head.ftl"/>
            <div class="arrived">
                <div class="arrive clearfix">
                    <div class="logo">
                        <a href="/index.htm"><img src="http://192.168.2.50/statics/images/logo.png" alt=""></a>
                    </div>
                    <div class="site">
                        <div class="choose">
                            <ul class="clearfix">
                                <li class="item li_1">出发</li>
                                <li class="item li_6 js_select">
                                    <select id="province" onchange="setCityGB2260(this.value);" name="province">
                                        <option selected="selected" value="0"></option>
                                    </select>
                                </li>
                                <li class="item li_6 js_select">
                                    <!--  <select id="outhead">
                                 <option value="0">无</option>
                             <option value="510100">成都</option>
                             </select> -->
                                    <select id="city" onchange="setCountyGB2260(this.value);" name="city">
                                        <option selected="selected" value="0"></option>
                                    </select>
                                </li>
                                <li class="item li_2 li_3">
                                    <input id="start">
                                </li>
                            </ul>
                        </div>
                        <div class="choose">
                            <ul class="clearfix">
                                <li class="item li_1">到达</li>
                                <li class="item li_6 js_select">
                                    <select id="province1" onchange="setCityGB22601(this.value);" name="province1">
                                        <option selected="selected" value="0"></option>
                                    </select>
                                    <!-- <select>
                             <option value="0">无</option>
                             <option value="310000">上海</option>
                             </select> -->
                                </li>
                                <li class="item li_6 js_select">
                                    <select id="city1" onchange="setCountyGB22601(this.value);" name="city1">
                                        <option selected="selected" value="0"></option>
                                    </select>
                                    <!--  <select id="arrivehead">
                                 <option value="0">无</option>
                             <option value="310000">上海市</option>
                             </select> -->
                                </li>
                            </ul>
                        </div>
                        <div class="choose">
                            <ul class="clearfix">
                                <li class="item li_1">运量</li>
                                <li class="item li_2">
                                    <input type="text" id="weighthead">
                                    <li class="item li_4">
                                        <select id="weightheadtype">
                                            <option value="2">吨</option>
                                            <option value="1">立方</option>
                                        </select>
                                    </li>
                                    <li class="item li_5">
                                        <input class="btn" type="button" onClick="searchhead();" value="搜 索">
                                    </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!--         <div class="site">
                 <table>
                    <thead>
                        <tr>
                            <td width="41">出发</td>
                            <td width="123">
                             <select>
                             <option value="0">无</option>
                             <option value="510100">四川</option>
                             </select>
                             </td>
                            <td width="135">
                                 <select id="outhead">
                                 <option value="0">无</option>
                             <option value="510100">成都</option>
                             </select>
                                </td>
                            <td>
                                <input class="inline laydate-icon" id="start"    type="text" ><i></i></td>
                        </tr>
                        <tr>
                            <td width="41">到达</td>
                            <td width="123">
                                <select>
                             <option value="0">无</option>
                             <option value="310000">上海</option>
                             </select>
                             </td>
                            <td width="135">
                             <td width="135">
                                 <select id="arrivehead">
                                 <option value="0">无</option>
                             <option value="310000">上海市</option>
                             </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td width="41">运量</td>
                            <td width="123">
                                <input type="text" id="weighthead">
                            </td>
                            <td width="135">
                                <select id="weightheadtype">
                                    <option value="2">吨</option>
                                    <option value="1">立方</option>
                                </select><b class="b_2"></b></td>
                            <td>
                                <input class="btn" type="button" onClick="searchhead();"  value="搜 索">
                            </td>
                        </tr>
                    </thead>
                </table>
            </div> -->
            <div class="main_p">
                <div class="main">
                    <div class="title clearfix">
                        <h3><a class="all"  href="javascript:;" id="allTrad" >我的交易</a> <b>
                <div class="more">
                <dl><dd>
                   <a href="javascript:;" id="applyRecord" onclick="applyRecordFunc();">全部申请</a>
                </dd></dl>
                
                </div>
                     
                </b></h3>
                        <ul>
                            <li class="name">
                                <#if Session[ "user_id"]?exists>
                                    ${helloUser('${user_id}')}
                                    <#else>
                                </#if>
                                <span> <div class="more">  
                <dl>
                    <dd class="set"><b class="b_1"></b><a href="/driver/getDriverInfo.htm">设置</a></dd>
                    <dd class="out"><b class="b_2"></b><a href="javascript:void(0);" onclick="logout();">退出</a></dd>
                </dl>
                </div></span>
                            </li>
                            <li>拉货${helloUser('${user_id}','3','3')}笔</li>
                            <li>接货率${helloUser('${user_id}','4','3','3')}%</li>
                            <li>交付率${helloUser('${user_id}','5','3','3','3')}%</li>
                        </ul>
                    </div>
                    <div id="content">
                    </div>
                    <div class="page" id="pagebar">
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="foot">
                    <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2015 HUO68.COM </p>
                </div>
            </div>
            <script type="text/javascript" src="http://192.168.2.50/static/js/location.js"></script>
            <script type="text/javascript" src="http://192.168.2.50/static/js/location1.js"></script>
            <script>
            var styleorder = "";
            var pagevar = 0;
            var sizeval = -6;
            var carlengh;
            var cartype;
            var carnumber;
            var fhbs;
            var jkl;
            var zhl;
            $(document).ready(function() {
                getoders();
                carlengthstrfc('${carlengthstr}');
                cartypestrfc('${cartypestr}');
                carnumber = '${carnumberstr}';
                fhbs = '${fhbs}';
                jkl = '${jkl}';
                zhl = '${zhl}';
            });
            //get货物
            showDialog();

            function getoders() {
                var paras = {
                    ordersStatus: styleorder,
                    currentPage: Number(pagevar) + 1
                };
                $("#content").empty();
                var load = "<div class=\"load\" style=\"width:32px;height:320px;padding-top:50px;margin:0 auto;\"><img src=\"http://192.168.2.50/statics/images/loading.gif\" alt=\"\"></div>"
                $("#content").append(load);
                $.ajax({
                    type: "POST",
                    url: "/ajax/driverallOrdersList.htm",
                    data: paras,
                    datatype: "json",
                    success: function(data) {
                        if (data != null && data != "") {
                            var obj = eval('(' + data + ')');
                            getodersList(obj.ordersList)
                            getPageList(Number(obj.flag));
                        } else {
                            $('#content').empty();
                            $("#content").append("<div class=\"reminder\">暂无交易/申请</div>");
                            styleorder = "";
                        }
                    }
                });
            }

            function hidediv() {
                $(".hidden_1").hide();
                $(".hidden_2").hide();
                $(".hidden_3").hide();
                $(".hidden_4").hide();
            }

            /****Order组件块****/
            function getodersList(obj) {
                if (obj) {
                    $("#content").empty();
                    var load = "<div class=\"load\" style=\"width:32px;height:320px;padding-top:50px;margin:0 auto;\"><img src=\"http://192.168.2.50/statics/images/loading.gif\" alt=\"\"></div>"
                    $("#content").append(load);
                    $('#content').empty();

                    if (obj.length > 0) {
                        var addhtml = "";
                        for (var i = 0; i < obj.length; i++) {
                            var orders = obj[i];
                            var statusval = "";
                            var statusbtn = "";

                            /****状态判断块****/
                            if (orders.status == 5) {
                                statusval = "<a href=\"javascript:;\" onclick=\"checkcancelapply('" + orders.id + "');\">取消申请</a>";
                                statusbtn = "<a href=\"javascript:;\" onclick=\"checkupdateapply('" + orders.weight + "','" + orders.square + "','" + orders.id + "');\">修改申请</a>";
                            } else if (orders.status == 100) {
                                statusval = "<a  href=\"javascript:;\" onclick=\"checkdetaok(\'1\','" + orders.id + "');\">违约投诉</a>";
                                statusbtn = "<a href=\"javascript:;\" onclick=\"checkdetaok(\'0\','" + orders.id + "');\">详细地址</a>";
                            }

                            if (orders.status == 100 && orders.dispute == 1) { //装货投诉
                                statusval = "<a class=\"introduce_color\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','" + orders.id + "');\">装货投诉中</a>";
                                statusbtn = "<a href=\"javascript:;\" onclick=\"checkdetaok(\'0\','" + orders.id + "');\">详细地址</a>";
                            } else if (orders.status == 100 && orders.dispute == 2) { //结款投诉
                                statusval = "<a class=\"introduce_color\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','" + orders.id + "');\">结款投诉中</a>";
                                statusbtn = "<a href=\"javascript:;\"  onclick=\"checkdetaok(\'0\','" + orders.id + "');\">详细地址</a>";
                            } else if (orders.status == 100 && orders.dispute == 5) { //装货投诉
                                statusval = "<a class=\"introduce_color\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','" + orders.id + "');\">装货投诉中</a>";
                                statusbtn = "<a href=\"javascript:;\"  onclick=\"checkdetaok(\'0\','" + orders.id + "');\">详细地址</a>";
                            } else if (orders.status == 100 && orders.dispute == 6) { //结款投诉
                                statusval = "<a class=\"introduce_color\" href=\"javascript:;\"  onclick=\"checkdetaok(\'1\','" + orders.id + "');\">结款投诉中</a>";
                                statusbtn = "<a href=\"javascript:;\"  onclick=\"checkdetaok(\'0\','" + orders.id + "');\">详细地址</a>";
                            }


                            if (orders.status == 101) {
                                statusval = "<a href=\"javascript:;\">交易完成</a>";
                                statusbtn = "<a class=\"gray_btn\" href=\"javascript:;\">交易已完成</a>";
                            } else if (orders.status == -4) { //申请结束
                                statusval = "<span>申请结束</span>";
                            } else if (orders.status == -2 && orders.isCargoDownShelve != 1 && orders.isCargoDownShelve != 2) { //重新申请----司机自己取消
                                statusval = "<a href=\"javascript:;\" onclick=\"checkupdateapply('" + orders.weight + "','" + orders.square + "','" + orders.id + "');\">重新申请</a>";
                                statusbtn = "<a class=\"gray_btn\" href=\"javascript:;\">已取消申请</a>";
                            }

                            if ((orders.isCargoDownShelve == 1 && orders.status == -1) || (orders.isCargoDownShelve == 2 && orders.status == -1)) { //1:司机下架；2：货主下架
                                statusval = "<a href=\"javascript:;\">暂停调车</a>";
                                statusbtn = "<a class=\"gray_btn\" href=\"javascript:;\">暂停调车</a>";
                            }


                            /****隐藏块****/
                            var hiddendiv = "";
                            /*申请中*/
                            if (orders.status == 5 && orders.isCargoDownShelve != 1 && orders.isCargoDownShelve != 2) {
                                //取消申请
                                var cancelapply = "<div class=\"hidden_1 hidden js_hidden_1\" id='apply1" + orders.id + "'><div class=\"hide sure_apply\"><p>是否取消申请？</p>" + "<div class=\"bttn\"><button class=\"sure js_appleA\" onclick=\"cancelapplyno('1','" + orders.id + "');\" >取消申请</button>" + "<button class=\"back_a js_back\" onclick=\"cancelapplyno('0','" + orders.id + "');\" >返回</button></div></div></div>";
                                //修改申请
                                var updateapply = "<div class=\"hidden_3 hidden js_hidden_3\" id='apply2" + orders.id + "'><div class=\"hide amend\"><ul class=\"clearfix\"><li class=\"li_1\"> 我的申请:</li><li class=\"li_2\">" + carnumber + "</li><li class=\"li_3\">" + carlengh + "</li><li class=\"li_4\">" + cartype + "</li><li class=\"li_2\">拉货" + fhbs + "笔</li><li class=\"li_2\"> 装货率<span>" + zhl + "% </span>" + "</li><li class=\"li_7\">结款率<span>" + jkl + "%</span> </li></ul><p> 价格<input class=\"price\" id=\"danjia" + orders.id + "\" type=\"text\"  onafterpaste=\"this.value=this.value.replace(/\/\/D/g,\'\')\">元/吨 </p><p> 数量<input class=\"number\" " + "type=\"text\"  onblur=\"istnum(this);\" onafterpaste=\"istnum(this);\" id=\"dun" + orders.id + "\">吨&nbsp;&nbsp;&nbsp;<span id=\"lifang" + orders.id + "\"></span>立方</p><p class=\"total\">总价 <strong>RMB&nbsp;&nbsp;<span id=\"totle" + orders.id + "\"></span></strong></p>" + "<div class=\"bttn\"><button class=\"sure js_sure\" onclick=\"cancelapplyyes(this,'1','" + orders.id + "','" + orders.cargoId + "','" + orders.operateTime + "');\">确认修改</button>" + "<button class=\"cancel js_sure\" onclick=\"cancelapplyyes(this,'0','" + orders.id + "');\">取消修改</button></div></div></div>";
                                hiddendiv = cancelapply + updateapply;
                            }
                            //已取消时再次重新申请
                            if (orders.status == -2 && orders.isCargoDownShelve != 1 && orders.isCargoDownShelve != 2) {
                                var againapply = "<div class=\"hidden_3 hidden js_hidden_3\" id='apply2" + orders.id + "'><div class=\"hide amend\"><ul class=\"clearfix\"><li class=\"li_1\"> 我的申请:</li><li class=\"li_2\">" + carnumber + "</li><li class=\"li_3\">" + carlengh + "</li><li class=\"li_4\">" + cartype + "</li><li class=\"li_2\">拉货" + fhbs + "笔</li><li class=\"li_2\"> 装货率<span>" + zhl + "% </span>" + "</li><li class=\"li_7\">结款率<span>" + jkl + "%</span> </li></ul><p> 价格<input class=\"price\" id=\"danjia" + orders.id + "\" type=\"text\"  onafterpaste=\"this.value=this.value.replace(/\/\/D/g,\'\')\">元/吨 </p><p> 数量<input class=\"number\" " + "type=\"text\"  onblur=\"istnum(this);\" onafterpaste=\"istnum(this);\" id=\"dun" + orders.id + "\">吨&nbsp;&nbsp;&nbsp;<span id=\"lifang" + orders.id + "\"></span>立方</p><p class=\"total\">总价 <strong>RMB&nbsp;&nbsp;<span id=\"totle" + orders.id + "\"></span></strong></p>" + "<div class=\"bttn\"><button class=\"sure js_sure\" onclick=\"cancelagainyes(this,'1','" + orders.id + "','" + orders.cargoId + "','" + orders.operateTime + "');\">确认重提</button>" + "<button class=\"cancel js_sure\" onclick=\"cancelapplyyes(this,'0','" + orders.id + "');\">取消重提</button></div></div></div>";
                                hiddendiv = againapply;
                            }


                            /*交易中*/
                            if (orders.status == 100 && (orders.dispute == 0 || orders.dispute == 3 || orders.dispute == 4 || orders.dispute == 7)) {
                                //取消投诉
                                var cancelok = "<div class=\"hidden_2 hidden js_hidden_2\" id='apply2" + orders.id + "'><div class=\"hide sure_apply_1\"><p>投诉<span>交易编号：" + orders.orderNo + "</span>" + " </p><div class=\"bttn\"><button class=\"back sure\" onclick=\"checkcancelok('2','" + orders.id + "');\">结款投诉</button><button class=\"apple_a sure\" onclick=\"checkcancelok('1','" + orders.id + "');\">" + "装货投诉</button><button class=\"cancel\" onclick=\"cancelapplyyes(this,'0','" + orders.id + "');\">返回</button></div></div></div>";
                                //详细信息
                                var detaok = "<div class=\"hidden_4 hidden js_hidden_4\" id='apply1" + orders.id + "'><div class=\"hide d_adress\"><p class=\"owner\">" + "发货方 ：<em>" + orders.companyInfo.companyName + "</em> </p><p class=\"owner\">联系电话 ：<em></em> <span>" + orders.linkPhone + "</span></p><p class=\"mar_t\">" + "接货地址： <span>" + orders.cityStr + orders.countyStr + orders.startAdd + "</span></p><p>目的地址： <span>" + orders.arrivalCityStr + orders.arrivalCountyStr + orders.arrivalAdd + "</span></p><p class=\"mar_t\">" + "<span></span></p><button class=\"cancel js_backBtn\" onclick=\"cancelapplyno('0','" + orders.id + "');\">返回</button></div></div>";
                                hiddendiv = cancelok + detaok;
                            }

                            /*投诉受理中*/
                            if (orders.dispute == 1 || orders.dispute == 2 || orders.dispute == 5 || orders.dispute == 6) {
                                var tempstatu = "";
                                var tempsbtn = "";
                                if (orders.dispute == 1) {
                                    tempstatu = "司机发货投诉中...";
                                    tempsbtn = "<button class=\"sure cancel_1\" onclick=\"checkcancelok('4','" + orders.id + "');\">取消投诉</button>";
                                } else if (orders.dispute == 2) {
                                    tempstatu = "司机结款投诉中...";
                                    tempsbtn = "<button class=\"sure cancel_1\" onclick=\"checkcancelok('4','" + orders.id + "');\">取消投诉</button>";
                                } else if (orders.dispute == 5) {
                                    tempstatu = "货主接货投诉中...";
                                } else {
                                    tempstatu = "货主结款投诉中...";
                                }
                                //详细地址
                                var detatousu = "<div class=\"hidden_4 hidden js_hidden_4\" id='apply1" + orders.id + "'><div class=\"hide d_adress\"><p class=\"owner\">" + "发货方 ：<em>" + orders.companyInfo.companyName + "</em> </p><p class=\"owner\">联系电话 ：<em></em> <span>" + orders.linkPhone + "</span></p><p class=\"mar_t\">" + "接货地址： <span>" + orders.cityStr + orders.countyStr + orders.startAdd + "</span></p><p>目的地址： <span>" + orders.arrivalCityStr + orders.arrivalCountyStr + orders.arrivalAdd + "</span></p><p class=\"mar_t\">" + "<span></span></p><button class=\"cancel js_backBtn\" onclick=\"cancelapplyno('0','" + orders.id + "');\">返回</button></div></div>";
                                //取消投诉
                                var canceltousu = "<div class=\"hidden_2 hidden js_hidden_2\"  id='apply2" + orders.id + "'><div class=\"hide sure_apply_1\"><p>投诉<span>交易编号：" + orders.orderNo + "</span> " + "</p><div class=\"bttn\"><button class=\"ing\">" + tempstatu + "</button>" + tempsbtn + "<button class=\"cancel cancel_1\" onclick=\"cancelapplyyes(this,'0','" + orders.id + "');\" >返回</button></div></div></div>";
                                hiddendiv = detatousu + canceltousu;
                            }

                            var tempget = false;
                            /****右边块****/
                            var rightdiv = "";
                            if (orders.status == -4) {
                                var btnfot = "";
                                if (styleorder == 5) {
                                    btnfot = "<a  class=\"gray_btn\" href=\"javascript:void(0)\" >申请结束</a>"
                                } else {
                                    btnfot = "<a href=\"javascript:void(0)\" onclick=\"btnLoseOrder('" + orders.id + "');\" >确认</a>";
                                }
                                //申请结束
                                var carnum = "";
                                if (orders.sucesperson != null && orders.sucesperson != "") {
                                    carnum = (orders.sucesperson).substring(0, 2) + "***" + (orders.sucesperson).substring(5, 7);
                                }
                                rightdiv = "<div class=\"rside\"><p class=\"introduce\">" + (orders.money / 100) + "/吨&nbspRMB" + (orders.total / 100) + "</p><p class=\"introduce\">" + orders.cargoName + "/" + orders.weight + "吨/" + orders.square + "/立方</p><p class=\"code_car\">对方信息: " + carnum + "</p>" + btnfot + "</div>";
                                tempget = true;
                            } else if (orders.status == 100 || orders.status == -2 || orders.status == 5 || orders.status == -1 || orders.status == 101) {
                                //普通样式
                                rightdiv = "<div class=\"rside\"><p class=\"introduce\"><span>我的申请&nbsp</span>" + (orders.money / 100) + "/吨</p><p class=\"price\">RMB&nbsp;" + (orders.total / 100) + "</p><p class=\"introduce\">" + orders.cargoName + "/" + orders.weight + "吨/" + orders.square + "立方</p>" + statusbtn + "</div>";
                                tempget = true;
                            }
                            var numtype = "";
                            if (orders.status == -4 || orders.status == -2 || orders.status == 5) {
                                numtype = "货源编号:" + orders.cargoNo;
                            } else {
                                numtype = "交易编号:" + orders.orderNo;
                            }

                            if (tempget) {
                                /****主内容****/
                                var citystr = orders.cityStr.substr(0, 5);
                                var arrivalcitystr = orders.arrivalCityStr.substr(0, 5);
                                var countrystr = orders.countyStr.substr(0, 7);
                                var arrivalcountrystr = orders.arrivalCountyStr.substr(0, 7);
                                var contentvar = "<p class=\"coding\">" + numtype + statusval + "</p>" +
                                    "<div class=\"lside\"><table><tr><td class=\"titl\">" + citystr + "</td><td width=\"55\"><img src=\"http://192.168.2.50/statics/images/r1.png\" alt=\"\"></td><td width=\"80\" class=\"titl\">" + arrivalcitystr + "</td></tr><tr><td>" + countrystr + "</td><td></td><td>" + arrivalcountrystr + "</td></tr><tr><td>" +
                                    orders.sendTimeStr + "</td><td></td><td>" + orders.arrivalTimeStr + "</td></tr></table><p class=\"text\">发货" + orders.fhdsStr + "笔 装货率" + orders.zhlStr + "% 结款率" + orders.jklStr + "%</p></div>" + rightdiv + hiddendiv + "</div>";


                                /****头尾****/
                                if (chk(i) === "1") {
                                    //  alert("等于1");
                                    if (i + 2 < obj.length) {
                                        addhtml += "<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show  clearfix\">" + contentvar + "</div>";
                                    } else {
                                        addhtml += "<div class=\"floor clearfix\"><div class=\"padd_r\"><div class=\"show  clearfix\">" + contentvar + "</div>";;
                                    }
                                } else if (chk(i) === "2") {
                                    addhtml += "<div class=\"padd_l\"><div class=\"show  clearfix\">" + contentvar + "</div></div></div>";
                                }
                                if (i + 1 < obj.length == false && chk(i) === "1") {
                                    addhtml += "</div>";
                                }
                            }
                        }
                        $("#content").append(addhtml);
                    }
                }
            }


            /****各种盒子的点击方法**start***/
            function checkcancelapply(val) {
                hidediv();
                $("#apply1" + val + "").show(400);
            }

            function checkcancelapply(val) {
                hidediv();
                $("#apply1" + val + "").show(400);
            }

            function cancelapplyno(pra, val) {
                    if (pra === '0') {
                        $("#apply1" + val + "").hide(400);
                    } else {
                        var paras = {
                            ordersId: val,
                            cancelCause: 0,
                            remark: "无"
                        };
                        $.ajax({
                            type: "POST",
                            url: "/ajax/drivercanelorder.htm",
                            data: paras,
                            datatype: "json",
                            success: function(data) {
                                var obj = eval('(' + data + ')');
                                if (obj.flag == 1) {
                                    setDialog('温馨提示', '取消交易成功')
                                        //alert("取消交易成功!");
                                        $("button").click(function(){
                                             getoders();
                                             return false;
                                        });
                               
                                } else {
                                    setDialog('温馨提示', obj.msg)
                                        //alert(obj.msg);
                                }
                            }
                        });

                    }
                }
                //确认交易结束
            function btnLoseOrder(val) {
                var paras = {
                    ordersId: val
                };
                $.ajax({
                    type: "POST",
                    url: "/ajax/loseOrder.htm",
                    data: paras,
                    datatype: "json",
                    success: function(data) {
                        var obj = eval('(' + data + ')');
                        if (obj.flag == 1) {
                            setDialog('温馨提示', '确认交易结束成功!')
                                //alert("取消交易成功");
                                $("button").click(function(){
                                             getoders();
                                             return false;
                                        });
                            
                        } else {
                            setDialog('温馨提示', obj.msg)
                                //alert(obj.msg);
                        }
                    }
                });
            }

            function checkupdateapply(weight, square, val) {
                hidediv();
                $("#danjia" + val).val("");
                $("#dun" + val).val("");
                $("#lifang" + val).html("");
                $("#totle" + val).html("");
                $("#apply2" + val + "").show(400);
                //价格
                $("#danjia" + val).bind("keyup", function() {
                    isMmoney($("#danjia" + val).val());
                    $("#danjia" + val).val($("#danjia" + val).val().replace(/\D/g, ''));
                    if ($("#dun" + val).val() != 0) {
                        $("#lifang" + val).html(((square / weight) * ($("#dun" + val).val())).toFixed(0)); //10:5---2:1
                        $("#totle" + val).html(($("#dun" + val).val()) * ($("#danjia" + val).val()));

                        $("#lifang" + val).val(((square / weight) * ($("#dun" + val).val())).toFixed(0));
                        $("#totle" + val).val(($("#dun" + val).val()) * ($("#danjia" + val).val()));
                    }

                });
                //数量
                $("#dun" + val).bind("keyup", function() {
                    istnum(this);
                    if (Number($("#dun" + val).val()) > Number(weight)) {
                        setDialog('温馨提示', '吨数超出货方的重量!')
                            //alert("取消交易成功");
                        $("#dun" + val).val("");
                    } else {
                        if ($("#danjia" + val).val() != 0) {
                            $("#lifang" + val).html(((square / weight) * ($("#dun" + val).val())).toFixed(0)); //10:5---2:1
                            $("#totle" + val).html(($("#dun" + val).val()) * ($("#danjia" + val).val()));

                            $("#lifang" + val).val(((square / weight) * ($("#dun" + val).val())).toFixed(0));
                            $("#totle" + val).val(($("#dun" + val).val()) * ($("#danjia" + val).val()));
                        }
                    }
                });
            }

            function cancelapplyyes(objx,pra, val, cargoid, optime) {
                if (pra === '0') {
                    $("#apply2" + val + "").hide(400);
                } else {
                    if ($("#danjia" + val).val() != "" && $("#totle" + val).val() != "" && $("#dun" + val).val() != "") {
                       $(objx).attr('disabled','disabled');
                        var paras = {
                            cargoIdM: cargoid,
                            orderIdM: val,
                            operateTimeM: optime,
                            unitPriceM: $("#danjia" + val).val(),
                            countM: $("#dun" + val).val(),
                            totalPriceM: $("#totle" + val).val()
                        };
                        $.ajax({
                            type: "POST",
                            url: "/orders/driverUpdateapplye.htm",
                            data: paras,
                            datatype: "json",
                            success: function(data) {
                                var obj = eval('(' + data + ')');
                                if (obj.flag == 1) {
                                    setDialog('温馨提示', '修改申请成功!')
                                        //alert("取消交易成功");
                                        $("button").click(function(){
                                             getoders();
                                             return false;
                                        });
                              
                                } else {
                                    setDialog('温馨提示', obj.msg)
                                    

                                    //alert('确定结款投诉!');
                                }
                      $(objx).removeAttr("disabled");

                            }
                        });
                    } else {
                        setDialog('温馨提示', '报价和重量都不能为空!');
                        return false;
                        // alert("取消交易成功");
                    }


                }
            }

            function cancelagainyes(objx,pra, val, cargoid, optime) {
                if ($("#danjia" + val).val() != "" && $("#totle" + val).val() != "" && $("#dun" + val).val() != "") {
                  $(objx).attr('disabled','disabled');
                    var paras = {
                        cargoIdM: cargoid,
                        orderIdM: val,
                        operateTimeM: optime,
                        unitPriceM: $("#danjia" + val).val(),
                        countM: $("#dun" + val).val(),
                        totalPriceM: $("#totle" + val).val()
                    };
                    $.ajax({
                        type: "POST",
                        url: "/orders/driveragainorder.htm",
                        data: paras,
                        datatype: "json",
                        success: function(data) {
                            var obj = eval('(' + data + ')');
                            if (obj.flag == 1) {
                                setDialog('温馨提示', '重新申请成功!');
                                //alert("取消交易成功");
                                $("button").click(function() {
                                    getoders();
                                })
                            } else {
                                setDialog('温馨提示', obj.msg);
                                //alert('取消交易成功');
                            }
                      $(objx).removeAttr("disabled");

                        }
                    });
                } else {
                    setDialog('温馨提示', '报价和重量都不能为空!');
                    // alert("取消交易成功");
                }
            }

            function checkdetaok(pra, val) {
                hidediv();
                if (pra === "0") {
                    $("#apply1" + val + "").show(400);
                } else {
                    $("#apply2" + val + "").show(400);
                }
            }


            function checkcancelok(pra, val) {
                var tempval = "";
                var causeM = "";
                if (pra === "1") {
                    tempval = "确定结款投诉!";
                    causeM = "司机交付投诉";
                };
                if (pra === "2") {
                    tempval = "确定装货投诉!?";
                    causeM = "司机装货投诉";
                };
                if (pra === "4") {
                    tempval = "确定取消投诉!?";
                    causeM = "司机装货投诉";
                };
                document.getElementById('dialogtitle').innerHTML = '温馨提示';
                document.getElementById('dialoginfo').innerHTML = tempval;
                $(".opacity-bg,.sure_box1").show();
                $(".sure_box1 h3 b").click(function(){
                     $(".opacity-bg,.sure_box1 ").hide();
                });
                $(".sure_box1 .confirm").click(function() {
                
                    $(".sure_box1 ").hide(0, function() {
                        var paras = {
                            ordersIdM: val,
                            causeM: "司机投诉",
                            tstype: pra
                        };
                        $.ajax({
                            type: "POST",
                            url: "/ajax/complainCargoer.htm",
                            data: paras,
                            datatype: "json",
                            success: function(data) {
                                var obj = eval('(' + data + ')');
                                if (obj.flag == 1) {
                                    setDialog('温馨提示', '操作成功!');
                                    $(".sure_box .confirm").click(function() {
                                            getoders();
                                        })
                                        // alert("确定结款投诉!");
                                } else {
                                    setDialog('温馨提示', obj.msg);
                                    //alert( '确定结款投诉!');
                                }
                            }
                        });

                    });
                });
                $(".sure_box1 h3 b,.sure_box1 .cel").click(function() {
                    $(".opacity-bg,.sure_box1").hide();
                });



                //
                // if (confirm(tempval)) {
                //     var paras = {
                //         ordersIdM: val,
                //         causeM: "司机投诉",
                //         tstype: pra
                //     };
                //     $.ajax({
                //         type: "POST",
                //         url: "/ajax/complainCargoer.htm",
                //         data: paras,
                //         datatype: "json",
                //         success: function(data) {
                //             var obj = eval('(' + data + ')');
                //             if (obj.flag == 1) {
                //                 setDialog('温馨提示', '操作成功!');
                //                 $("button").click(function() {
                //                         getoders();
                //                     })
                //                     // alert("确定结款投诉!");

                //             } else {

                //                 setDialog('温馨提示', obj.msg);

                //                 //alert( '确定结款投诉!');
                //             }
                //         }
                //     });
                // }

            }





            /****各种盒子的点击方法**end***/

            //奇偶结果
            function chk(num) {
                return num ? num % 2 ? "2" : "1" : "1"
            }

            function countTotal(weight, square, val) {
                var wnum = $("#dun" + val).val();
                var per = $("#danjia" + val).val();
                /*if(wnum!=""&&per!=""){
                  $("#totle"+val).val((wnum*per).toFixed(2));
                  $("#lifang"+val).val(((square/weight)*wnum).toFixed(2));
                }*/
            }

            function isMmoney(obj) {
                if (obj.value > 9999) {
                    obj.value = obj.value.substr(0, obj.value.length - 1);
                }
            }

            function carlengthstrfc(val) {
                if (val == 0) {
                    carlengh = "其它";
                } else if (val == 1) {
                    carlengh = "9.6米";
                } else if (val == 2) {
                    carlengh = "13米";
                } else if (val == 3) {
                    carlengh = "17.5米";
                }
            }

            function cartypestrfc(val) {
                    if (val == 0) {
                        cartype = "其它车型";
                    } else if (val == 7) {
                        cartype = "箱式车";
                    } else if (val == 1) {
                        cartype = "平板车";
                    } else if (val == 4) {
                        cartype = "不限车型";
                    } else if (val == 11) {
                        cartype = "高栏车";
                    }
                }
                //首页搜索
            function searchhead() {
                var para = "";
                para = "?goCity=" + ($("#outhead").val() != "" ? $("#outhead").val() : 0) + "&toCity=" + ($("#arrivehead").val() != "" ? $("#arrivehead").val() : 0) + "&sendTime=" + ($("#start").val() != "" ? $("#start").val() : 0) + "&headweight=" + ($("#weighthead").val() != "" ? $("#weighthead").val() : 0) + "&weightheadtype=" + ($("#weightheadtype").val() != "" ? $("#weightheadtype").val() : 0);
                window.parent.location.href = "/index.htm" + para;
            }


            //个人全部申请条件查询
            /*  function searchoders(obj,val){
                pagevar=0;
                sizeval=-6;
                if(val==="0"){
                  styleorder="";
                }else{
                  styleorder=val;
                }
                getoders();
              }*/
            function allTradFunc() {
                $("#allTrad").html("我的交易");
                $("#applyRecord").html("全部申请");
                document.getElementById("applyRecord").setAttribute("onclick", "applyRecordFunc()");
                pagevar = 0;
                sizeval = -6;
                styleorder = "";
                getoders();
            }

            function applyRecordFunc() {
                $("#allTrad").html("全部申请");
                $("#applyRecord").html("我的交易");
                document.getElementById("applyRecord").setAttribute("onclick", "allTradFunc()");
                pagevar = 0;
                sizeval = -6;
                styleorder = 5;
                getoders();
            }

            function istnum(obj) {
                var reg = /^\d{0,9}.\d{0,2}$/;
                if (!reg.test(obj.value)) {
                    obj.value = obj.value.substr(0, obj.value.length - 1);
                }
                var values = obj.value.replace(/(.)(?=[^$])/g, "$1,").split(",");
                for (var c = 0; c < values.length; c++) {
                    var idReg = /^[0-9][0-9]*$/;
                    if (!idReg.test(values[c]) && values[c] != ".") {
                        obj.value = obj.value.substr(0, obj.value.length - 1);
                    }
                    if (c > 0 && values[0] == 0 && values.indexOf(".") == -1) {
                        obj.value = obj.value.substr(0, 0);
                    } else if (values[0] == 0 && values[1] == 0) {
                        obj.value = obj.value.substr(0, 0);
                    } else if (values.indexOf(".") != -1 && values[0] == ".") {
                        obj.value = "";
                    }
                }
                if (obj.value > 999999999.99) {
                    obj.value = '';
                }
            }


            //翻页
            function pagechange(obj, val, sizevals) {
                    pagevar = val;
                    sizeval = sizevals;
                    getoders();
                }
                //pagediv
            function getPageList(pagesizemy) {
                $('#pagebar').empty();
                //-4:首页;-1:上一页；-2：下一页；-3：尾页
                if (pagesizemy > 1) {
                    var addhtmlpage = "";
                    var pagevarInt = Number(pagevar);
                    if (pagesizemy > 5) {
                        // if(sizeval==-1){}else 
                        /*if(sizeval==3){//准备换页数字
                           if()
                         }else if(sizeval==4){//省略号后面的..
                           
                         }*/
                        if (pagevarInt != 0) {
                            addhtmlpage += "<ul><li class=\"home p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + 0 + "\',\'" + 0 + "\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt - 1) + "\',\'" + (pagevarInt - 1) + "\');return false;\">&nbsp&nbsp</a></li>"; //黑色todo:还未做
                        } else {
                            addhtmlpage += "<ul><li class=\"home\"><a href=\"javascript:;\" ></a></li><li class=\"pgup\"><a href=\"javascript:;\" ></a></li>"; //不是黑色  
                        }

                        if (pagevarInt >= 3 && (pagevarInt + 2) < pagesizemy) {
                            //中部
                            for (var i = 0; i < 5; i++) {
                                if (i == 0) {
                                    addhtmlpage += "<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt - 2) + "\',\'" + (pagevarInt - 2) + "\');return false;\">" + (pagevarInt - 1) + "</a></li>";
                                } else if (i == 1) {
                                    addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt - 1) + "\',\'" + (pagevarInt - 1) + "\');return false;\">" + (pagevarInt) + "</a></li>";
                                } else if (i == 2) {
                                    addhtmlpage += "<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + pagevarInt + "\',\'" + pagevarInt + "\');return false;\">" + (pagevarInt + 1) + "</a></li>";
                                } else if (i == 3) {
                                    addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt + 1) + "\',\'" + (pagevarInt + 1) + "\');return false;\">" + (pagevarInt + 2) + "</a></li><li class=\"excessive\"></li>";
                                } else {
                                    if (pagesizemy > pagevarInt + 7) {
                                        addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt + 6) + "\',\'" + (pagevarInt + 6) + "\');return false;\">" + (pagevarInt + 7) + "</a></li>";
                                    } else {
                                        addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (Number(pagesizemy) - 1) + "\',\'" + (Number(pagesizemy) - 1) + "\');return false;\">" + pagesizemy + "</a></li>";
                                    }
                                }
                            }
                        } else if (pagevarInt < 3) {
                            for (var i = 0; i < 5; i++) {
                                if (i == 4) {
                                    if (pagesizemy > 10) {
                                        addhtmlpage += "<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + 10 + "\',\'" + 10 + "\');return false;\">" + 10 + "</a></li>";
                                    } else {
                                        addhtmlpage += "<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 1) + "\',\'" + (pagesizemy - 1) + "\');return false;\">" + pagesizemy + "</a></li>";
                                    }
                                } else {
                                    if (i == sizeval || sizeval == -6) {
                                        addhtmlpage += "<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + i + "\',\'" + i + "\');return false;\">" + (i + 1) + "</a></li>";
                                        sizeval = sizeval;
                                    } else {
                                        addhtmlpage += "<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + i + "\',\'" + i + "\');return false;\">" + (i + 1) + "</a></li>";
                                    }
                                }
                            }
                        } else { //尾页
                            addhtmlpage += "<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt - 5) + "\',\'" + (pagevarInt - 5) + "\');return false;\">" + (pagevarInt - 4) + "</a></li>" + "<li class=\"excessive\"></li>";
                            addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 4) + "\',\'" + (pagesizemy - 4) + "\');return false;\">" + (pagesizemy - 3) + "</a></li>";
                            addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 3) + "\',\'" + (pagesizemy - 3) + "\');return false;\">" + (pagesizemy - 2) + "</a></li>";
                            if ((pagevarInt + 1) == Number(pagesizemy)) {
                                addhtmlpage += "<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 2) + "\',\'" + (pagesizemy - 2) + "\');return false;\">" + (pagesizemy - 1) + "</a></li>";
                                addhtmlpage += "<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + pagevarInt + "\',\'" + pagevarInt + "\');return false;\">" + pagesizemy + "</a></li>";
                            } else {
                                addhtmlpage += "<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 2) + "\',\'" + (pagesizemy - 2) + "\');return false;\">" + (pagesizemy - 1) + "</a></li>";
                                addhtmlpage += "<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 1) + "\',\'" + (pagesizemy - 1) + "\');return false;\">" + pagesizemy + "</a></li>";
                            }
                        }
                        if (pagesizemy != (pagevarInt + 1)) {
                            addhtmlpage += "<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt + 1) + "\',\'" + (pagevarInt + 1) + "\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 1) + "\',\'" + (pagesizemy - 1) + "\');return false;\">&nbsp&nbsp</a></li></ul>"; //不是黑色 
                        } else {
                            addhtmlpage += "<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\"></a></li></ul>"; //黑色todo:还未做
                        }
                    } else { //少于5页
                        if (pagevarInt == 0) {
                            addhtmlpage += "<ul><li class=\"home \"><a href=\"javascript:;\" ></a></li><li class=\"pgup \"><a href=\"javascript:;\"  ></a></li>";
                        } else {
                            addhtmlpage += "<ul><li class=\"home  p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + 0 + "\',\'" + 0 + "\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\"  onClick=\"pagechange(this,\'" + (pagevarInt - 1) + "\',\'" + (pagevarInt - 1) + "\');return false;\">&nbsp&nbsp</a></li>";
                        }
                        for (var i = 0; i < pagesizemy; i++) {
                            if (i == sizeval || sizeval == -6) {
                                addhtmlpage += "<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + i + "\',\'" + i + "\');return false;\">" + (i + 1) + "</a></li>";
                                sizeval = -1;
                            } else {
                                addhtmlpage += "<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + i + "\',\'" + i + "\');return false;\">" + (i + 1) + "</a></li>";
                            }
                        }
                        if (pagesizemy == (pagevarInt + 1)) {
                            addhtmlpage += "<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\" ></a></li></ul>";
                        } else {
                            addhtmlpage += "<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagevarInt + 1) + "\',\'" + (pagevarInt + 1) + "\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'" + (pagesizemy - 1) + "\',\'" + (pagesizemy - 1) + "\');return false;\">&nbsp&nbsp</a></li></ul>";
                        }
                    }
                    $("#pagebar").append(addhtmlpage);
                }
            }
            var start = {
                elem: '#start',
                format: 'YYYY-MM-DD',
                min: laydate.now(),
                max: '2099-06-16',
                istime: true,
                istoday: false

            };
            laydate(start);

            function setDialog(title, info) {
                document.getElementById('mydialogtitle').innerHTML = title;
                document.getElementById('mydialoginfo').innerHTML = info;

                $(".opacity-bg,.sure_box").show();
                $(".sure_box h3 b,.sure_box button").click(function() {
                    $(".opacity-bg,.sure_box").hide();
                })
            }

            function showDialog() {
                light_box = " <div class=\"opacity-bg1\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box1\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"dialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"dialoginfo\" ></span></p><button class=\"cel\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer;color: #feae4f;outline: none;background: url(http://192.168.2.50/statics/images/btn_3.png) no-repeat;margin-right: 37px;\">取消</button><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
                light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
                $(".footer").after(light_box1);
                $(".footer").after(light_box);
            }
            </script>
        </body>

        </html>
    </#escape>
</#compress>
