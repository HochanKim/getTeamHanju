<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/sellerRoot.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="../../js/sellerSideBar3.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="sellerSideBar2.jsp"></jsp:include>
        <div id="app">
            <div id="container">
                <sample2-component></sample2-component>
            </div>
            <button @click="fnTest">test</button>
        </div>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
</body>

</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                userId : "${sessionId}",
                userStatus : "${sessionStatus}",
            };
        },
        methods: {
            fnTest() {
                sideBarObj.fnMenuClick();
            }
        },
        mounted() {
            
        },
    });
    const appObj = app.mount("#app");
</script>