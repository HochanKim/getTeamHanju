<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../css/sellerPage/sellerSideBar.css" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <div id="sideBar">
        <div id="sideTitle">
            나의 사업장
        </div>
        <div id="sideBox">
            <div class="normalMenu">
                <a href="sellerMain.do">사업자 홈</a>
            </div>
            <hr>
            <div class="menu">
                <p>제품 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href="registerProduct.do"> - 제품 등록</a></div>
                <div><a href="modifyProduct.do"> - 제품 수정</a></div>
            </div>
            <div class="menu">
                <p>일반 판매 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href="registerNormalSell.do"> - 일반 판매 등록</a></div>
                <div><a href="modifyNormalSell.do"> - 판매글 수정</a></div>
            </div>
            <!-- <div class="menu">
                <p>펀딩 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href="registerFunding.do"> - 펀딩 게시</a></div>
                <div> - 펀딩 수정</div>
            </div> -->
            <div class="menu">
                <p>공동구매 관리</p>
                <span class="material-symbols-outlined">arrow_drop_down</span>
            </div>
            <div class="subMenu">
                <div><a href="registerGroupSell.do"> - 공동구매 등록</a></div>
                <div><a href="modifyGroupSell.do">- 공동구매 수정</a></div>
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