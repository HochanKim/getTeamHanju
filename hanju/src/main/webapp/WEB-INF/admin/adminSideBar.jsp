<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../css/admin/adminSideBar.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <div id="sideBar">
        <div id="sideTitle">
            관리자 구역
        </div>
        <div id="sideBox">
            <div class="normalMenu">
                <a href="adminMain.do">관리자 홈</a>
            </div>
            <div class="menu">
                <p>유저 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href=""> - </a></div>
                <div><a href=""> - </a></div>
            </div>
            <div class="menu">
                <p>사업자 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href=""> - </a></div>
                <div> - </div>
            </div>
            <div class="menu">
                <p>제품 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href=""> - </a></div>
                <div> - </div>
            </div>
            <div class="menu">
                <p>일반 판매 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href=""> - </a></div>
                <div> - </div>
            </div>
            
            <div class="menu">
                <p>공동구매 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href=""> - </a></div>
                <div> - </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>
$(function() {
    $(".menu").on("click", function(e) {
        var status = $(this).next().css("maxHeight");

        if (status == "0px") {
            $(this).next().css("maxHeight", "200px");
            $(this).children("span").text("arrow_drop_up");
        } else {
            $(this).next().css("maxHeight", "0px");
            $(this).children("span").text("arrow_drop_down");
        }
    });
});
</script>