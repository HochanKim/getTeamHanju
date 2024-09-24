<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/registerNormalSell.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <!-- Quill CDN -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
        <jsp:include page="../mainPage/header.jsp"></jsp:include>
        <div id="main">
            <jsp:include page="sellerSideBar.jsp"></jsp:include>
            <div id="container">
                <h3>일반 판매 등록</h3>
                <hr>
                <div id="contents" v-html="contents"></div>
            </div>
        </div>
        <jsp:include page="../mainPage/footer.jsp"></jsp:include>
    </div>
</body>

</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                userId : "${sessionId}",
                userStatus : "${sessionStatus}",

                contents : "",
            }
        },
        methods: {
            fnTest() {
                $.ajax({
					url:"test.dox",
					dataType:"json",
					type : "POST", 
					data : { sellId : 78 },
					success : (data) => {
						console.log(data);
                        this.contents = data.result.contents;
					}
				});
            }
        },
        mounted() {
            this.fnTest();
        },
    });
    app.mount("#app");
</script>