/**
 * @Author: 梁大波  2017-04-16 17:20:56
 *+----------------------------------------------------------------------
 *| 泛亚认证 [ 微信点餐 ]
 *| Copyright (c) 2016-2017 http://www.dtypt.com All rights reserved.
 *| Version 1.00
 *| <947663049@qq.com>
 *+----------------------------------------------------------------------
 */
//server_url = "http://ldb.istiny.cc/index.php/";
/*#########################################
*             确认订单
*#########################################*/
/*获取当前时间*/
function time () {
    var mydate = new Date();
    var year = mydate.getYear(); //获取当前年份(2位)
    var fullyear = mydate.getFullYear(); //获取完整的年份(4位,1970-????)
    var month = mydate.getMonth(); //获取当前月份(0-11,0代表1月)
    var date = mydate.getDate(); //获取当前日(1-31)
    var day = mydate.getDay(); //获取当前星期X(0-6,0代表星期天)
    var time = mydate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
    var hours = mydate.getHours(); //获取当前小时数(0-23)
    var minutes = mydate.getMinutes(); //获取当前分钟数(0-59)
    var seconds = mydate.getSeconds(); //获取当前秒数(0-59)
    var milliseconds = mydate.getMilliseconds(); //获取当前毫秒数(0-999)
    var localedatestring = mydate.toLocaleDateString(); //获取当前日期
    var localestring= mydate.toLocaleString( ); //获取日期与时间
    var localetimestring= mydate.toLocaleTimeString(); //获取当前时间
    Date.prototype.Format = function (fmt) { // author: meizz
        var o = {
            "M+": this.getMonth() + 1, // 月份
            "d+": this.getDate(), // 日
            "h+": this.getHours(), // 小时
            "m+": this.getMinutes(), // 分
            "s+": this.getSeconds(), // 秒
            "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
            "S": this.getMilliseconds() // 毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    var yMD = new Date().Format("yyyy-MM-dd");
    var yMDHMS = new Date().Format("yyyy-MM-dd hh:mm:ss");
    //console.log("当前时间"+yMD)
   return yMD
}
/*自定义格式时间选择*/
$(".yearMD").datetimePicker({
    times: function () {
        return [
            {
                values: ['-']
            }
        ];
    },
    value: '',
    max: time(),
    onChange: function (picker, values, displayValues) {
        //console.log(values);
    }
});
$(".yearMDHSM").datetimePicker({
    title: '请选择时间',
    yearSplit: '-',
    monthSplit: '-',
    dateSplit: '',
    times: function () {
        return [  // 自定义的时间
            {
                values: (function () {
                    var hours = [];
                    for (var i=0; i<24; i++) hours.push(i > 9 ? i : '0'+i);
                    return hours;
                })()
            },
            {
                divider: true,  // 这是一个分隔符
                content: ':'
            },
            {
                values: (function () {
                    var minutes = [];
                    for (var i=0; i<59; i++) minutes.push(i > 9 ? i : '0'+i);
                    return minutes;
                })()
            },
            {
                divider: true,  // 这是一个分隔符
                content: ''
            }
        ];
    },

   //输出时间打印
  //  onChange: function (picker, values, displayValues) {
  //      console.log(values);
  //  }

});

/*动态加载数据*/
function iniFnite(url,type) {
    //console.log("iniFnite方法="+url+'  请求类型='+type);  //测试
   // weuiLoadmore(); //动态加载完毕   //测试
    var loading = false;  //状态标记
    var n=1;
    $(document.body).infinite('80').on("infinite", function() {
        if(loading) return;
        loading = true;
        setTimeout(function() {
            $.ajax({
                type: "post",
                url: server_url + "Shop/getShop",
                data: {'targetPage':n,'url':url,'type':type},
                cache: false,
                async : false,
                dataType: "json",
                success: function (data)
                {
                    ++n;
                    //console.log(n)
                    $('.weui-loadmore').before(data.data);
                    loading = false;
                    if (data.totalPage == n) {
                        loading = true;
                        weuiLoadmore(); //动态加载完毕
                    }
                },
                error:function (data) {
                    //console.log(data);
                    weuiLoadmore(); //动态加载完毕
                }
            });
        }, 800);   //模拟延迟

    });
}
/*动态加载完毕*/
function weuiLoadmore() {
    var weuiLoadmore=$('.weui-loadmore');
    var weuiLoading=$('.weui-loading');
    var weuiLoadmoreTips=$('.weui-loadmore__tips');
    weuiLoadmore.addClass("weui-loadmore_line");
    var weuiLoadmoreLine=$('.weui-loadmore_line');
    weuiLoading.remove();
    weuiLoadmoreLine.css({"margin-top":"1em"});
    weuiLoadmore.css({ "margin-bottom": "-0.5em", "line-height": "1.4em"});
    weuiLoadmoreTips.text("已经到底了")
}
/**
 * +--------------------------------------------------------------------
 *|#########            购物车、点餐                            ##########
 *+---------------------------------------------------------------------
 * */
$(document).ready(function(){
    $(".dish-item-dish").eq(-1).css("margin-bottom","60px");
    $(".dish-type-item").eq(0).addClass("is-active");
    var html= $(".dish-type-item").eq(0).text();//菜品
    $(".dish-item-type").text(html);

})
/*菜品导航*/
$(".dish-type-item").click(function () {
    $(".dish-type-item").removeClass("is-active");
    $(this).addClass("is-active");
    var liBottom=$("li.dish-item-dish:last");
   $(".dish-item-dish").eq(-1).css("margin-bottom","60px"); //菜单最后一个离底部距离
    var html=$(this).text();//菜品
    $(".dish-item-type").text(html);
    //console.log(liBottom.html())
})
/*店铺是否打样*/
$(".dialog-footer").click(function () {
    console.log("00000");
        $(".shopStatus").remove();   //移除打样
        $(".counter-min--nonum").remove();  //移除添加

})
/*添加数量*/

$(document).on("click", ".counter-add", function () {
    var food_id = $(this).attr("data-id");
    var obj=this;
    //console.log(food_id)
    //console.log(server_url)

    $.ajax({
        type: "post",
        url: server_url+"Car/addFood",
        data: {"food_id":food_id, 'shop_id':shop_id},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data)

        {
            //console.log(data);
            if(data.status==1){
                var num=data.num;
                var money=data.value;
                shop('add',obj,num,money);
            }
            else {
                $.alert("提交失败");
            }
        },
        error:function (data) {
           $.toast("请求失败！", "forbidden");
        }
    });
});

/*减少数量*/
$(document).on("click",".counter-minus", function () {
    /*
    var counter_num=$(this).parent().find(".counter-num");
    var cart_ordered_dish=$(this).parent().parent().parent(".cart-ordered-dish");
    console.log(cart_ordered_dish);
    var n=$(counter_num).text();//商品数量
*/

    var food_id = $(this).attr("data-id");
    var obj=this;
     //console.log(food_id)

    $.ajax({
        type: "post",
        url: server_url+"Car/delFood",
        data: {"food_id":food_id, 'shop_id':shop_id},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if(data.start=1){
                var num=data.num;
                var money=data.value;
                shop('del',obj,num,money);
            }
            else {
                $.alert("提交失败");
            }

/*
            var tinyCartLightNumber=$(".cart-container").find(".tiny-cart-left").find(".cart-icon");//获取选好菜品个数div
            var moneyTotal=$(".cart-container").find(".tiny-cart-left").find(".tiny-cart-text");//获取选好支付金额div
            tinyCartLightNumber.attr("data-count",data.num);
            moneyTotal.html(data.value);

            n=Number(n);
            n =n-1;
            if(n<=0){
                $(counter_num).html("0");
                $(counter_num).css('display','none');
                $(this).css('display','none');
                cart_ordered_dish.remove();
            }
            else {
                $(counter_num).html(n);
            }
            //shopMoney(this,n);
            //console.log(n);
            */

        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
           $.toast("请求失败！", "forbidden");
        }
    });

})
/*购物菜单和价格处理*/
function shop(type,obj,num,money) {

    $(".cart-container").parent().addClass("dropin-shopcart-animation");//购物车特效
    setTimeout(function(){$(".cart-container").parent().removeClass("dropin-shopcart-animation");},800);//购物车特效
    var tinyCartTextRight=$(".cart-container").find(".tiny-cart-right");//获取选好了div按钮
    var tinyCartLightNumber=$(".cart-container").find(".tiny-cart-left").find(".cart-icon");//获取选好菜品个数div
    var moneyTotal=$(".money");//获取选好支付金额div

    var counter_minus=$(obj).parent().find(".counter-minus");//获取减少按钮
    var counter_num=$(obj).parent().find(".counter-num");//单个获取菜品个数
    var counter_add=$(obj).parent().find(".counter-add");//获取增加按钮
    var cart_ordered_list=$(obj).parent().parent().parent().parent(".cart-ordered-list");//获取订单--》单个菜按钮

    var n=Number($(counter_num).text());//商品数量
    if(type=="add"){
        n=n+1;
        $(counter_num).css('display','block');
        $(counter_minus).css('display','block');
        $(counter_num).text(n);//单个商品数量
    }
    if(type=="del"){
        n=n-1;
       if(n<=0){
           $(counter_num).css('display','none');
           $(counter_minus).css('display','none');
           $(cart_ordered_list).remove();
           n=0;

       }
        $(counter_num).text(n);//单个商品数量
    }

    if(num>0){
        tinyCartTextRight.html("<a class='tiny-cart-btn btn--yellow' href="+sureUrl+">选好啦</a>");
        moneyTotal.removeClass(".tiny-cart-text");
        moneyTotal.addClass(".tiny-cart-price price noShipmentFee moneyTotal");
        tinyCartLightNumber.attr("data-count",num);
        moneyTotal.html(money);

        //console.log(moneyTotal);
        //tinyCartLightNumber.css("")
    }
    else{
        tinyCartTextRight.html(" ");
        moneyTotal.removeClass(".tiny-cart-price price noShipmentFee moneyTotal");
        moneyTotal.addClass(".tiny-cart-text");
        moneyTotal.html("购物车是空的");
        $(tinyCartLightNumber[0]).removeAttr("data-count");
        window.location.reload();
    }
    //console.log("当前点餐个数="+num+"  当前支付金额="+money+"  当前单菜个数="+n);

}

/*查看购物车*/

$(document).on("click",".tiny-cart-left", function () {
    var obj=this;
    //$(".expand-cart").fadeToggle("slow");

    $.ajax({
        type: "post",
        url: server_url+"Car/car",
        data: {'shop_id':shop_id},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if(data.status==0){
                //$.toast("购物车为空！", "forbidden",50000);
                window.location.reload();
                //$.alert("您还没购物");
            }
            else if(data.status==1){
                $(".expand-cart").toggle(); //购物车切换
                $(".expand-cart-main").remove();//移除元素
                $(".expand-cart").append(data.html);//增加元素
                var num=data.num;
                var money=data.value;
                shop('add',obj,num,money);
            }
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            $.alert("请求失败！");
            window.location.reload();

        }
    });
   // $(".expand-cart").fadeToggle(1000);
});

/*清空购物车*/

$(document).on("click",".expand-cart-clear", function () {
    $.ajax({
        type: "post",
        url: server_url+"Car/truncate",
        data: {'shop_id':shop_id},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if (data.status == 1) {
                $(".expand-cart").fadeOut("slow");//购物车隐藏
            }
            window.location.reload();
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
           $.toast("请求失败！", "forbidden");
            window.location.reload();
        }
    });
});

/*关闭当前页面*/
function closeFoodShow() {
    $(".foodShow").fadeOut("slow");
}
/*确定处理订单*/
/*
$(document).on("click",".tiny-cart-btn", function () {
    window.location.href = sure;
})
*/
/*#########################################
*             确认订单
*#########################################*/

/*桌台验证*/
$(document).on("click",".table",function () {
    $('#tableLi').css("display","flex");
    $('#mobileLi').css("display","none");
    const tableID=$(this).find(".tableID").text();
    $('.seat').removeClass("seatTable");
    $(this).find(".fa").toggleClass('seatTable',1000);
    $('#sureTable').val(tableID);
    //$('#shop_table').val(tableID);
    //console.log(tableID);

})
function sureTable1(){
    var table=$('#sureTable').val();
    //console.log(server_url+"0000000000000"+table);
   $.ajax({
        type: "post",
        url: server_url+"Table/check",
        data: {'shop_id':shop_id,'number':table},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if (data.status == 1) {
                //$.toast("选择成功00");
            }
            else {
                $.toast("无此桌台", "cancel");
                $('#sureTable').val("");
                $('#sureTable').focus();

                }
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
           $.toast("请求失败！", "forbidden");
            window.location.reload();
        }
    });

}

/*前台自取*/

$(document).on("click", "#getMy", function() {
    $('#tableLi').css("display","none");
    $('#mobileLi').css("display","flex");
    $.prompt({
        text: "请填写你的电话号码，方便联系！",
        title: "联系方式",
        onOK: function(text) {

            if (!text || !/1[3|4|5|7|8]\d{9}/.test(text)) {
                $.toptip('请输入正确手机号', 'warning');
                return false;
            }else {
                $('#mobile').val(text);
                //$('#shop_tel').val(text);
            }
        },
        onCancel: function() {
            console.log("取消了");
        },
        input: '请输入手机号'
    });
})

/*配送选择  支付选择*/
$(document).on("click","#submitCarPay",function () {
    var data = $('.formData').serializeArray();
    // if (!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号', 'warning');
   // else {
        $.ajax({
            type: "post",
            url: server_url + "Car/pay",
            data:data,
            cache: false,
            async: false,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                if (data.status == 1) {
                    $.toast("操作成功");
                    //location.reload();
                    //window.history.pushState('forward', null, '#');
                    //window.history.forward(1);
                    //location.replace(document.referrer);//刷新
                } else {
                    $.toast(data.msg,'cancel');
                }
                console.log(data.redirect);
                console.log(data.redirect);
                if (data.redirect != undefined) {
                  /*  $.alert({
                        title: '消息提示',
                        text: '订单10分钟未付款自动取消！！！',
                        onOK: function () {
                        }
                    });*/
                    setTimeout(function(){
                        console.log(data.redirect)
                        console.log(data.redirect != undefined)
                        location.href = data.redirect;
                    },2000);
                }

                $('#sureTable').focus();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.toast("请求失败！", "forbidden");
            }
        });
        return false;
   // }
    return false;

})
/*添加就餐人数*/

$(document).on("click",".customers-counter-add",function () {
    var n =Number($("input[name=counter_num]").val());
    n+=1;
    console.log(n);
    $("input[name=counter_num]").val(n);
    /*
    $.ajax({
        type: "post",
        url: "",
        data: {'n':n},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if (data.status == 1) {
                n+=1;
                console.log(n);
                $("input[name=counter_num]").val(n);
            }
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
           $.toast("请求失败！", "forbidden");
            window.location.reload();
        }
    });
   */

})
/*减少就餐人数*/

$(document).on("click",".customers-counter-minus",function () {
    console.log("customers-counter-minus");
    var n =Number($("input[name=counter_num]").val());
    if(n>1){
        n-=1;


    }
    else {
       n=1;
        $.toast("最少为1人", "cancel");
    }
    $("input[name=counter_num]").val(n);

    /*
     $.ajax({
         type: "post",
         url: "",
         data: {'n':n},
         cache: false,
         async : false,
         dataType: "json",
         success: function (data ,textStatus, jqXHR)
         {
             if (data.status == 1) {
                   if(n>1){
                    n-=1;
                }
                else {
                   n=1;
                    $.toast("最少为1人", "cancel");
                }
                $("input[name=counter_num]").val(n);
             }
         },
         error:function (XMLHttpRequest, textStatus, errorThrown) {
            $.toast("请求失败！", "forbidden");
             window.location.reload();
         }
     });
    */
})

/*#########################################
*             商店列表
*#########################################*/

/*商店搜索*/
function shopCheck(obj){
    var type=$("#eat_type").val();
    var name=$(obj).val();
    $.ajax({
        type: "post",
        url: server_url+"Shop/lists",
        data: {'name':name,'type':type},
        cache: false,
        async : false,
        dataType: "json",
        success: function (data ,textStatus, jqXHR)
        {
            if (data.status == 1) {
                $("li").remove();
                $('.weui-loadmore').before(data.data);
                //$('ul').append(data.data);
            }
            else {

            }
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) {
            $.toast("请求失败！", "forbidden");
        }
    });
}
/*#########################################
*             个人中心   用户设置
*#########################################*/

/*男女选着器*/
$(document).on("click",".c-sex-switch__label",function () {

    $(".c-sex-switch__label").children("input").removeClass("c-sex-switch__radio--selected");
    var radio=$(this).children("input");
    //console.log(radio)
    radio.addClass("c-sex-switch__radio--selected");
    //console.log(radio.val())

})
/*用户设置*/
$(document).on("click","#submitCustomer",function () {
    var data = $('.formData').serializeArray();
    //console.log(data);

    var name=(data[0].value);
    var sex=(data[1].value);
    var birthday=(data[2].value);
    var wechat=(data[3].value);
    var tel=(data[4].value);

    if(!name) $.toptip('请输入2位以上姓名','warning');
    else if(!sex) $.toptip('请选择性别','warning');
    else if(!birthday) $.toptip('请选择生日','warning');
    else if(!wechat) $.toptip('请填写微信号','warning');
    else if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号','warning');
    else {

        $.ajax({
            type: "post",
            url: server_url+"Customer/edit",
            data: data,
            cache: false,
            async: false,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                if (data.status == 1) {
                    $.toast("操作成功");
                    location.reload();
                    //window.history.pushState('forward', null, '#');
                    //window.history.forward(1);
                    //location.replace(document.referrer);//刷新
                }
                else {
                    $.toast('操作失败', 'error');
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.toast("请求失败！", "forbidden");
            }
        });
        return false;
    }
    return false;
})

/*提交按钮*/
$(document).on("click","#submitPrimary",function () {
    var data = $('.formData').serializeArray();
    console.log(data);

    var name=(data[0].value);
    //var sex=(data[1].value);

    var time=(data[1].value);
    var wechat=(data[2].value);
    var tel=(data[3].value);

    if(!name) $.toptip('请输入2位以上姓名','warning');
    else if(!wechat) $.toptip('请输入微信号','warning');
    else if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号','warning');
    else {
        $.ajax({
            type: "post",
            url: server_url+"Shop/lists",
            data: {'name': name, 'type': type},
            cache: false,
            async: false,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                if (data.status == 1) {
                    $.toast("操作成功");
                }
                else {
                    $.toast('操作失败', 'error');
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $.toast("请求失败！", "forbidden");
            }
        });
    }

    return false;
})
/*公共提交按钮*/
function formSubmit(url) {
    $(document).on("click","#submit",function () {
        var data = $('.formData').serializeArray();
        console.log(data);

        var name=(data[0].value);
        var sex=(data[1].value);
        var tel=(data[2].value);
        var address=(data[3].value);
        var street=(data[4].value);
        var remark=(data[5].value);

        if(!name) $.toptip('请输入2位以上姓名','warning');
        else if(!sex) $.toptip('请选择性别','warning');
        else if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号','warning');
        else if(!address) $.toptip('请选择地址','warning');
        else if(!street) $.toptip('请填写街道信息','warning');
        else {

            $.ajax({
                type: "post",
                url: server_url+url,
                data: data,
                cache: false,
                async: false,
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    if (data.status == 1) {
                        $.toast("操作成功");
                        window.history.pushState('forward', null, '#');
                        window.history.forward(1);
                        location.replace(document.referrer);//刷新
                    }
                    else {
                        $.toast('操作失败', 'error');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.toast("请求失败！", "forbidden");
                }
            });
           return false;
        }
        return false;
    })
}
/*地址选择管理*/


/*父页面*/



/*#########################################
*             导航栏
*#########################################*/

/*点击切换*/
$(document).on("click",".expand-control",function () {
    var icon=$(".iconI");
    var navText=$('.navText');
    $( ".floating-nav-container" ).toggleClass( "slide-right", 1000 );
    $( ".nav-items" ).toggleClass( "fade-in", 1000 );
    //$( ".icon" ).removeClass( "icon-double-arrow-right", 1000 );
    icon.toggleClass( "icon-double-arrow-left", 1000 );
    if(navText.text()=="快速导航"){
        navText.text("收起")
    }else{
        navText.text("快速导航")
    }
    return false;
})