<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/registerFunding.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <!-- Quill CDN -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
    <script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
	<link rel="stylesheet" href="https://unpkg.com/@vuepic/vue-datepicker@latest/dist/main.css">
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
        <div id="app">
            <h3>펀딩 등록</h3>
            <hr>
            <table id="inputTemplate">
                <tr>
                    <th>제품</th>
                    <td>
                        <select v-model="productId">
                            <option v-for="item in productList" :value="item.productId">{{item.productName}}</option>
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
                    <th>목표금액</th>
                    <td>
                        <input type="text" v-model="targetAmount">
                    </td>
                </tr>
                <tr>
                    <th>옵션 목록</th>
                    <td>
                        <table id="optionTable">
                            <tr>
                                <th>옵션명</th>
                                <th>가격</th>
                            </tr>
                            <tr v-for="item in optionList">
                                <td>{{item.optionName}}</td>
                                <td>{{item.optionPrice}}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>옵션 추가</th>
                    <td>
                        <table id="inputOptionTable">
                            <tr>
                                <th>옵션명</th>
                                <td><input type="text" v-model="inputOptionName"></td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td><input type="text" v-model="inputOptionPrice"></td>
                                <td>
                                    <button @click="fnAddOption">추가하기</button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td>
                        <vue-date-picker v-model="endDate" locale="ko"></vue-date-picker>
                    </td>
                </tr>
                <tr>
                    <th>상세 설명</th>
                    <td>
                        <div id="editor"></div>
                    </td>
                </tr>
            </table>
            <button @click="fnTest">펀딩 등록</button>
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

                productList : [],

                productId : "",
                description : "",
                targetAmount : "",
                optionList : [],
                inputOptionName : "",
                inputOptionPrice : "",
                endDate : new Date(),
                contents : "",
            }
        },
        components: { 
			VueDatePicker 
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
            fnAddOption() {
                this.optionList.push({
                    optionName  : this.inputOptionName,
                    optionPrice : this.inputOptionPrice
                });
                this.inputOptionName  = "",
                this.inputOptionPrice = ""
            },
            fnTest() {
                console.log(this.endDate.getFullYear() );
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