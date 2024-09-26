<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/mainPage/mainPage.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>Document</title>
</head>
<body>
    <jsp:include page="header.jsp" flush="false" />
    <div id="app">
        <div id="imageSlider">imageSlider</div>
        <div id="bestProducts">bestProducts</div>
        <div id="recommendProducts">recommendProducts</div>
    </div>
    <jsp:include page="footer.jsp" flush="false" />
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
            
        }
    });
    app.mount("#app");
    </script>
