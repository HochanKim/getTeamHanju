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
                <table>
                    <tr>
                        <th>제품</th>
                        <td>
                            <select v-model="productId">
                                <option v-for="item in productList" :value="item.productId">
                                    {{item.productName}}
                                </option>
                            </select>
                            <!-- <input id="searchBox" type="text" placeholder="검색"> -->
                        </td>
                    </tr>
                    <tr>
                        <th>할인율</th>
                        <td>
                            <select v-model="discount">
                                <option v-for="i in 100" :value="i-1">{{ i-1 }}%</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>제품 설명</th>
                        <td>
                            <textarea v-model="description" class="description"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            상세 설명
                        </th>
                        <td>
                            <div id="editor"></div>
                        </td>
                    </tr>
                </table>
                <button @click="fnRegisterSell">게시하기</button>
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

                quill : "",

                productList : [],
                
                productId : "",
                discount : 0,
                description : "",
                contents : "",
            }
        },
        methods: {
            fnGetProductList() {
                $.ajax({
					url:"getProductList.dox",
					dataType:"json",
					type : "POST", 
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
                        this.productList = data.list;
					}
				});
            },
            fnRegisterSell() {
                $.ajax({
					url:"registerSell.dox",
					dataType:"json",
					type : "POST",
					data : {
                        productId   : this.productId,
                        discount    : this.discount,
                        description : this.description,
                        contents    : this.contents
                    },
					success : (data) => {
						console.log(data);
                        alert("게시되었습니다!");
                        this.fnInit();
					}
				});
            },
            fnInit() {
                this.productId = "";
                this.discount = 1;
                this.description = "";
                this.quill.root.innerHTML = "";
                this.contents = "";
            }
        },
        mounted() {
            this.fnGetProductList();

            this.quill = new Quill('#editor', {
                theme: 'snow',
                modules: {
                    toolbar: [
                        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                        ['bold', 'italic', 'underline'],
                        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                        ['link', 'image'],
                        ['clean']
                    ]
                }
            });
            this.quill.on('text-change', () => {
                this.contents = this.quill.root.innerHTML;
            });
        },
    });
    app.mount("#app");
</script>