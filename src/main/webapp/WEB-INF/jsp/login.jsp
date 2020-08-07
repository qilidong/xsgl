<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>RBAC权限管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../adminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../adminLTE/dist/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../adminLTE/dist/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../adminLTE/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../adminLTE/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        /************jQuery.Validate插件样式开始********************/
        label.error {
            color: Red;
        }

        input.error {
            border: dashed 1px red;
        }

        /************jQuery.Validate插件样式结束********************/
    </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>RBAC</b>权限管理</a>
    </div>
    <!-- /.login-logo -->

    <div class="login-box-body">
        <p class="login-box-msg">请登录你的账号</p>
        <h4 style="color: red">${param.errorMge}</h4>
        <form action="" method="post" id="form">
            <div class="form-group has-feedback">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <input type="text" class="form-control" placeholder="请输入账号" name="userAccount">

            </div>
            <div class="form-group has-feedback">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <input type="password" class="form-control" placeholder="请输入密码" name="userPassworld">

            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="../../adminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../adminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../adminLTE/plugins/iCheck/icheck.min.js"></script>
<!-- jquery.validate -->
<script src="../../adminLTE/plugins/validate/jquery.validate.min.js"></script>
<!-- layer -->
<script src="../../layer/layer.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
        validateRule();
    })

    $.validator.setDefaults({
        submitHandler: function () {
            doAjaxLogin()
        }
    });

    function validateRule() {
        $("#form").validate({
            rules: {
                userAccount: {
                    required: true,
                },
                userPassworld: {
                    required: true,
                }
            },
            messages: {
                userAccount: {
                    required: "请输入账号",
                },
                userPassworld: {
                    required: "请输入密码"
                }
            },
            errorClass: "error",//错误提示的css类名"error"
        });
    }

    function doAjaxLogin() {
        var loadingIndex = null;
        $.ajax({
            type: "post",
            url: "/doAjaxLogin",
            dataType: 'json',
            data: $("#form").serialize(),
            beforeSend: function () {
                //加载
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success: function (result) {
                layer.close(loadingIndex);
                if (result.success) {
                    window.location.href = "main";
                } else {
                    layer.msg("用户登录账号或密码不正确，请重新输入", {time: 2000, icon: 5, shift: 6}, function () {

                    });
                }
            }
        })

    }
</script>
</body>
</html>

