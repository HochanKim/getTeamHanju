<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/sellerMain.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
        <div id="header">
            header
        </div>
        <div id="main">
            <div id="sideBar">
                <table>
                    <tr>
                        <td>제품 등록</td>
                    </tr>
                    <tr>
                        <td>일반 판매 등록</td>
                    </tr>
                    <tr>
                        <td>펀딩 등록</td>
                    </tr>
                    <tr>
                        <td>공동 구매 등록</td>
                    </tr>
                </table>
            </div>
            <div id="container">
                <table>
                    <tr>
                        <td>제품명</td>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <td>썸네일</td>
                        <td>사진 등록</td>
                    </tr>
                    <tr>
                        <td>상세 정보 이미지</td>
                        <td>사진 등록</td>
                    </tr>
                    <tr>
                        <td>타입</td>
                        <td>선택 박스 (와인, 전통주, 전통주 와인, 선물세트)</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>원산지</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>도수</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>탄산 정도</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>단 맛</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>신 맛</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>쓴 맛</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>바디감</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>용량</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>재고</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>색깔</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>원재료</td>
                        <td><input type="text"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="footer">
            footer
        </div>
    </div>
</body>

</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                
            };
        },
        methods: {
            
        },
        mounted() {

        },
    });
    app.mount("#app");
</script>