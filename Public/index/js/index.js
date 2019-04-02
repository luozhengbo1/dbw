layui.use('carousel', function(){
    var carousel = layui.carousel;
    //top轮播
    carousel.render({
        elem: '#topad'
        ,width: '100%'
        ,height: '30%'
        ,autoplay:true
        ,interval: 1000*2
        ,full:false
    });
//监听轮播切换事件
    carousel.on('change(topad)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
        console.log("当前条目的索引"+obj.index); //当前条目的索引
        console.log("上一个条目的索引"+obj.prevIndex); //上一个条目的索引
        console.log(obj.item); //当前条目的元素对象
    });
});