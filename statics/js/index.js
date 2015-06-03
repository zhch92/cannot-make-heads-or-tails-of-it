$(document).ready(function() {
    //状态切换
    $(".screen_item dd a").click(function() {
        $(this).addClass("chose").siblings().removeClass("chose");
    });
    $(".main h3 a").click(function() {
        $(this).addClass("active").siblings().removeClass("active");
    })


    //取消申请出现
    $(".js_canAplBtn").on("click", function() {
        $(this).closest('.js_show').children(".js_hidden_1").show(1000);
    });
    //取消申请消失
    $(".js_back,.js_appleA").on("click", function() {
        $(this).closest(".js_hidden_1").hide(1000);
    });

    //取消投诉
    $(".js_cancelBtn").on("click", function() {
        $(this).closest('.js_show').children(".js_hidden_2").show(1000);
    });
    //违约投诉
    $(".breach").on("click", function() {
        $(this).closest('.js_show').children(".js_hidden_2").show(1000);
    });

    //  点击详细地址
    $(".js_addrBtn").on("click", function() {
        $(this).closest('.js_show').children(".js_hidden_4").show(1000);
    });
    //  点击修改申请
    $(".js_AppleBtn").on("click", function() {
        $(this).closest('.js_show').children(".js_hidden_3").show(1000);
    });

    //取消修改  ,确认修改
    $(".js_cancel,.js_sure").on("click", function() {
        $(this).closest(".js_hidden_3").hide(1000);
    });

    $(".js_backBtn").on("click", function() {
        $(this).closest(".js_hidden_4").hide(1000);
    });
    //弹出层
    $(".lightbox .sure b,.cel,.sure_box b").on("click", function() {
        $(".opacity-bg,.sure_box").hide()
    });
    $(".bttn .back").on("click", function() {
        $(".opacity-bg,.sure_box").show()
    });
    //  城市筛选
    $(function() {
            $(".js_select").bind('click', function() {
                $(this).addClass("z").siblings().removeClass("z")
            });
            $(".js_select").bind('click', function() {
                $(this).find('.js_ulLi').toggle()
            });
            $(".js_ulLi li").bind('click', function() {
                var value = $(this).text();
                $(this).closest('.js_select').find('.js_value').html(value);
                $(this).find('.js_ulLi').hide();
            });
            $(document).bind('click', function(e) {
                if ($(e.target).closest('.js_select').length == 0) {
                    $(this).find('.js_ulLi').hide();
                }
            });


        })
        //查看详情
        // 弹出层
    $(".lightbox .sure b,.cel,.details_box  b").on("click", function() {
        $(".opacity-bg,.details_box ").hide()
    });
    $(".look").on("click", function() {
        $(".opacity-bg,.details_box").show()
    });
    //

    $(function() {
        $(".togg").on("click", function() {
            $(this).closest(".detail_item").next().toggle()
        });
        $(".togg").on("click", function() {
            $(this).find("i").toggleClass("tempcss")
        })

    })




})
