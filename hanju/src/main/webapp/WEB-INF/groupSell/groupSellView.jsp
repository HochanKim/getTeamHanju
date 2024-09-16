<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/groupSell/groupSellView.css" />
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
            <div id="groupSellView">
                <div id="summary">
                    <div id="imageView">
                        <div id="imageBox">
                            image
                        </div>
                        <div id="imageNav">
                            <div class="circle"></div>
                            <div class="circle"></div>
                            <div class="circle"></div>
                        </div>
                    </div>
                    <div id="summaryContent">
                        summaryContent
                    </div>
                </div>
                <div id="content">
                    content
                </div>
            </div>
            <div id="review">
                review
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
                groupSellId : '${groupSellId}'
            };
        },
        methods: {
            fnTest() {
                console.log(this.groupSellId);
            }
        },
        mounted() {
            this.fnTest();
        },
    });
    app.mount("#app");
</script>