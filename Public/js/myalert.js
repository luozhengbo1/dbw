layui.define('jquery', function (exports) {
    "use strict";
    var $ = layui.jquery;
    var myalert = {
        post: function (url, params, callback) {
			console.log('diaoyongfangfa');
        },
        v: '1.0.0'
    };
    exports('myalert', myalert);
});