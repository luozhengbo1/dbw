layui.config({
	//base: '../common/lib/'
});
layui.use(['form','jquery','layer','element'],function(){
	var $ = layui.$,
	layer = layui.layer,
	element = layui.element;

	$(document).ready(function() {
		// 浏览器兼容检查
	//layer.msg("欢迎来到泛亚信通微信点餐")
	});
});
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