$(document).ready(function() {
    //点击选框切换背景
    // $("input").on("click", function() {
    //         $(".main_1").addClass("main_2")
    //     })
    //显示司机注册

    $(".driver").on("click", function() {
        var checkzone1 = document.all("register");
        checkzone1[0].checked = true;
        checkzone1[1].checked = false;
        // $(".main_1").rmoveClass("main_2");
        $(".main_1").addClass("main_3");
        $(".company").removeClass("register_active");
        $(".person").addClass("register_active");
        document.getElementById('personchosee').style.display = "";
        document.getElementById('companychosee').style.display = "none";
    });
    //显示货方注册
    $(".comp").on("click", function() {
        var checkzone1 = document.all("register");
        checkzone1[0].checked = false;
        checkzone1[1].checked = true;
        $(".main_1").removeClass("main_3");
        $(".main_1").addClass("main_2");
        $(".person").removeClass("register_active");
        $(".company").addClass("register_active");
        $(".company").addClass("register_active");
        document.getElementById('companychosee').style.display = "";
        document.getElementById('personchosee').style.display = "none";

    });
    $(".img_1").on("click",function(){
        var checkzone1 = document.all("register");
          checkzone1[0].checked = false;
          checkzone1[1].checked = false;       
          checkzone1[2].checked = true;   
          checkzone1[3].checked = false;   
          checkzone1[4].checked = false; 


    })
  
   
})
