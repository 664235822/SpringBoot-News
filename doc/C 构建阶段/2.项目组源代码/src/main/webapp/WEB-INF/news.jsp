<%@ page import="com.entity.News" %>
<%@ page import="com.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: zz664
  Date: 2022/5/17
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            let newsId = $("#newsId").text();

            $.ajax({
                url: "${pageContext.request.contextPath}/comments/queryCommentList",
                type: "POST",
                dataType: "json",
                data: {"newsId": newsId, "currentPage": 1},
                success: function (data) {
                    $("#currentPage").text(data.currentPage);
                    let html = "";
                    $.each(data.list, function (i, item) {
                        html += '<li class="clearfix"><div class="text_con l">' +
                            '<div class="desc_news">' + item.content + '</div>' +
                            '<div class="info"><span>作者：' + item.username + '</span>' +
                            '<input class="page" type="button" onclick="deleteComments(' + item.id + ')"' +
                            ' value="删除"/></div></div></li>';
                    })
                    $("#comment").html(html);
                }
            })

            $("#publish-button").click(function () {
                let newsId = $("#newsId").text();
                let username = $("#username").text();
                let content = $("#content").val();

                if (content === "") {
                    alert("内容不能为空白");
                    return;
                }

                $.ajax({
                    url: "${pageContext.request.contextPath}/comments/publish",
                    type: "POST",
                    dataType: "json",
                    data: {
                        "newsId": newsId,
                        "username": username,
                        "content": content
                    },
                    success: function (data) {
                        if (data === true) {
                            window.location.reload();
                        } else {
                            alert("发表评论失败");
                        }
                    },
                    error: function (data) {
                        alert("发表评论失败");
                    }
                })
            })

            $("#lastPage").click(function () {
                let currentPage = $("#currentPage").text();
                if (parseInt(currentPage) === 1) {
                    alert("已经是第一页！");
                    return;
                }

                currentPage--;

                $.ajax({
                    url: "${pageContext.request.contextPath}/comments/queryCommentList",
                    type: "POST",
                    dataType: "json",
                    data: {"newsId": newsId, "currentPage": currentPage},
                    success: function (data) {
                        $("#currentPage").text(data.currentPage);
                        let html = "";
                        $.each(data.list, function (i, item) {
                            html += '<li class="clearfix"><div class="text_con l">' +
                                '<div class="desc_news">' + item.content + '</div>' +
                                '<div class="info"><span>作者：' + item.username + '</span>' +
                                '<input class="page" type="button" onclick="deleteComments(' + item.id + ')"' +
                                ' value="删除"/></div></div></li>';
                        })
                        $("#comment").html(html);
                    }
                })
            })

            $("#nextPage").click(function () {
                let total = $("#comments-index").text();
                let currentPage = $("#currentPage").text();
                if (parseInt(total / 10 + 1) === parseInt(currentPage)) {
                    alert("已经是最后一页！");
                    return;
                }

                currentPage++;

                $.ajax({
                    url: "${pageContext.request.contextPath}/comments/queryCommentList",
                    type: "POST",
                    dataType: "json",
                    data: {"newsId": newsId, "currentPage": currentPage},
                    success: function (data) {
                        $("#currentPage").text(data.currentPage);
                        let html = "";
                        $.each(data.list, function (i, item) {
                            html += '<li class="clearfix"><div class="text_con l">' +
                                '<div class="desc_news">' + item.content + '</div>' +
                                '<div class="info"><span>作者：' + item.username + '</span>' +
                                '<input class="page" type="button" onclick="deleteComments(' + item.id + ')"' +
                                ' value="删除"/></div></div></li>';
                        })
                        $("#comment").html(html);
                    }
                })
            })
        })

        function clickLike(newsId) {
            let username = $("#username").text();
            if (username === "登录") {
                alert("请登录后再点赞");
                return;
            }

            $.ajax({
                url: "${pageContext.request.contextPath}/news/clickLikes",
                type: "POST",
                dataType: "json",
                data: {"newsId": newsId, "username": username},
                success: function (data) {
                    window.location.href = '${pageContext.request.contextPath}/news/queryNews?id=<%=((News) session.getAttribute("news")).getId()%>';
                }
            })
        }

        function deleteComments(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/comments/delete",
                type: "POST",
                dataType: "json",
                data: {
                    "id": id
                },
                success: function (data) {
                    if (data === true) {
                        window.location.reload();
                    } else {
                        alert("删除新闻失败");
                    }
                },
                error: function (data) {
                    alert("删除新闻失败");
                }
            })
        }
    </script>
</head>
<body>
<div id="new_header" class="special-header">
    <div class="page-container new-header clearfix" id="nav" style="width:1152px;">
        <ul class="nav-item">
            <li><a href="${pageContext.request.contextPath}/main" target="_self" class="imooc">首页</a></li>
            <li><% if (request.getSession().getAttribute("user") != null) {%>
                <a href="${pageContext.request.contextPath}/admin" target="_self"
                   id="username"><%=((User) session.getAttribute("user")).getUsername()%>
                </a>
                <%} else {%>
                <a href="${pageContext.request.contextPath}/login" target="_self" id="username">登录</a><%}%>
            </li>
            <li><a href="${pageContext.request.contextPath}/register" target="_self">注册</a></li>
        </ul>
    </div>
</div>
<div id="main">
    <div class="sub-header">
        <div class="inner">
            <span class="sub-logo">新闻</span><span id="newsId"><%=((News) session.getAttribute("news")).getId()%></span>
        </div>
    </div>
    <div class="main_con" style="clear: both">
        <div class="main_con">
            <div class="list_con">
                <ul id="news">
                    <li class="clearfix">
                        <div class="text_con l">
                            <p class="title"><%=((News) session.getAttribute("news")).getTitle()%>
                            </p>
                            <div class="info"><span>作者：<%=((News) session.getAttribute("news")).getUsername()%></span>
                            </div>
                            <div class="desc_news"><%=((News) session.getAttribute("news")).getContent()%>
                            </div>
                            <img src="${pageContext.request.contextPath}/static/img/like.png" width="20px" height="20px"
                                 onclick="clickLike(<%=((News) session.getAttribute("news")).getId()%>)"/>
                            <span><%=((News) session.getAttribute("news")).getLike()%></span>
                            <img src="${pageContext.request.contextPath}/static/img/comment.png" width="20px"
                                 height="20px"/>
                            <span id="comments-index"><%=((News) session.getAttribute("news")).getComments()%></span>
                        </div>
                    </li>
                </ul>
                <div class="clearfix">
                    <p class="title">评论</p>
                    <textarea id="content" class="publish-comment-textarea"></textarea>
                    <input id="publish-button" class="publish-button" type="button" value="发表"/>
                </div>
                <ul id="comment">
                    <li>当前无评论</li>
                </ul>
                <input id="lastPage" class="page" type="button" value="上一页"/>
                第<span id="currentPage"></span>页
                <input id="nextPage" class="page" type="button" value="下一页"/>
            </div>
        </div>
        <div class="right_con fixed" style="">
            <div class="wechatma-con js-wechatma-con">
                <div class="ma-con">
                    <image class="ma" src="${pageContext.request.contextPath}/static/img/664235822.png"></image>

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
