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
            <jsp:include page="sellerSideBar.jsp"></jsp:include>
            <div id="container">
                sellerMain
            </div>
        </div>
        <div id="footer">
            footer
        </div>
        <testVue />
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