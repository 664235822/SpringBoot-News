<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻首页</title>
    <link rel="stylesheet" href="/SpringBoot-News/static/css/index.css"/>
    <script src="/SpringBoot-News/static/js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $.ajax({
                url: "/SpringBoot-News/news/querylist",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    $("#news-index").html(data.total);
                    let html = "";
                    $.each(data.list, function (i, item) {
                        html += '<li class="clearfix"> <div class="text_con l"> ' +
                            '<a href="/SpringBoot-News/read/92" target="_blank"> <p class="title">' + item.title + '</p> </a> ' +
                            '<div class="info"> <span>作者：' + item.author + '</span> </div> <div class="desc">' +
                            item.content + '</div> <div class="try-read-box clearfix"> </div> </div> </li>'
                    })
                    $("#news").html(html);
                }
            })
        })
    </script>
</head>
<body>
<div id="new_header" class="special-header">
    <div class="page-container new-header clearfix" id="nav" style="width:1152px;">
        <ul class="nav-item">
            <li><a href="/SpringBoot-News/main" target="_self" class="imooc">首页</a></li>
            <li><a href="/SpringBoot-News/login" target="_self">登录</a></li>
            <li><a href="/SpringBoot-News/register" target="_self">注册</a></li>
        </ul>
    </div>
</div>
<div id="main">
    <div class="sub-header">
        <div class="inner">
            <span class="sub-logo">新闻</span>
            <p class="total-course">共<span id="news-index"></span>篇</p>
        </div>
    </div>
    <div class="main_con" style="clear: both">
        <div class="main_con">
            <div class="list_con">
                <ul id="news">

                </ul>
            </div>
        </div>
        <div class="right_con fixed" style="">
            <div class="wechatma-con js-wechatma-con">
                <div class="ma-con">
                    <div class="ma">
                    </div>

                    <div class="desc">
                        <div class="title">
                            关注SmallPig1997
                        </div>
                        <div class="item-con">
                            <div class="item">
                                编程技巧
                            </div>
                            <div class="item">
                                视频剪辑
                            </div>
                            <div class="item">
                                游戏分享
                            </div>
                            <div class="item">
                                人生导师
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-con">
                    遵从本心
                </div>
            </div>
        </div>
        <div class="bottom-line">
            <div class="line"></div>
            <div class="bottom-tip">书贵于精，不贵于多</div>
            <div class="line"></div>
        </div>
    </div>
    <div id="footer" data="read,list">
        <div class="waper">
            <div class="footerwaper clearfix">
                <div class="footer_intro l">
                    <div class="footer_link">
                        <ul>
                            <li><a href="#" target="_blank">网站地图</a></li>
                            <li><a href="#" target="_blank">网站首页</a></li>
                            <li><a href="#" target="_blank">企业服务</a></li>
                            <li><a href="#" target="_blank">关于我们</a></li>
                            <li><a href="#" target="_blank">联系我们</a></li>
                            <li><a href="#" target="_blank">讲师招募</a></li>
                            <li><a href="#" target="_blank">帮助中心</a></li>
                            <li><a href="#" target="_blank">意见反馈</a></li>
                            <li><a href="#" target="_blank">代码托管</a></li>
                            <li><a href="#" target="_blank">友情链接</a></li>
                            <li><a href="#" target="_blank">合作专区</a></li>
                            <li><a href="#" target="_blank">关于我们</a></li>
                        </ul>
                    </div>
                    <p>Copyright <img draggable="false" class="moco-emoji" alt="©"
                                      src="https://www.imooc.com/static/moco/v1.0/images/face/36x36/a9.png"> 2021
                        imooc.com All Rights Reserved | <a rel="nofollow" href="https://beian.miit.gov.cn/"
                                                           style="color: #93999F;" target="_blank">京ICP备
                            12003892号-11</a> <a rel="nofollow"
                                                href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802030151"
                                                style="color: #93999F;margin:0 5px;" target="_blank"><i
                                class="beian"></i>京公网安备11010802030151号</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>