layui.use(['form', 'laydate','element'], function(){
    var form = layui.form
        ,laydate = layui.laydate;
    var element = layui.element;
    var $= layui.jquery;
    //同时绑定多个
    lay('.daytime').each(function(){
        laydate.render({
            elem: this
            ,trigger: 'click'
        });
    });
    //创建一个编辑器
    //var editIndex = layedit.build('LAY_demo_editor');
    //自定义验证规则
    form.verify({
        userName: function(value){
            if(value.length < 2){
                return '姓名至少得2个字符';
            }
        }

    });
    //监听提交
    form.on('submit(formButton)', function(data){
        layer.msg(JSON.stringify(data.field));
        return false;
    });
    //监听提交
    form.on('submit(formExit)', function(){
        layer.msg("注销");
        return false;
    });
    $( ".layui-nav-item" ).click(function() {
        var value=$(this).children()[0].innerHTML;
        layer.msg('点击了我:['+value+"]");

    })
});