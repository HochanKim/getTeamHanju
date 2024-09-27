<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/registerGroupSell.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="https://unpkg.com/@vuepic/vue-datepicker@latest"></script>
	<link rel="stylesheet" href="https://unpkg.com/@vuepic/vue-datepicker@latest/dist/main.css">
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
        <div id="app">
            <div id="container">
                <h3>공동 구매 등록</h3>
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
                        <th>목표 인원</th>
                        <td>
                            <input type="text" v-model="targetAmount">
                        </td>
                    </tr>
                    <tr>
                        <th>종료일</th>
                        <td>
                            <vue-date-picker v-model="endDate" locale="ko"></vue-date-picker>
                        </td>
                    </tr>
                    <tr>
                        <th>할인율</th>
                        <td>
                            <select v-model="discount">
                                <option v-for="i in 100" :value="i-1">{{i-1}}%</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>상세 설명 이미지</th>
                        <td class="imageUploaderLine">
                            <div class="imgBox">
                                <img v-if="detailImgUrl == ''" class="img" src="../../image/defaultImg.png"> 
                                <img v-else class="img" :src="detailImgUrl">
                            </div>
                            <label class="imgUploadBtn">
                                등록하기
                                <input type="file" @change="fnImgChange" style="visibility: hidden;" multiple>
                            </label>
                        </td>
                    </tr>
                </table>
                <button @click="fnRegisterGroupSell">게시하기</button>
            </div>
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
                endDate : new Date(),
                discount : 0,
                detailImg : "",
                detailImgUrl : "",
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
            fnRegisterGroupSell() {
                $.ajax({
					url:"registerGroupSell.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        productId    : this.productId,
                        description  : this.description,
                        targetAmount : this.targetAmount,
                        endDate      : this.fnChangeDBFormat(this.endDate),
                        discount     : this.discount,
                    },
					success : (data) => {
						console.log(data);
                        this.fnUploadProductImg(data.groupSellId, this.detailImg, "D");
					}
				});
            },
            fnImgChange(event) {
                this.detailImg = event.target.files[ 0 ];
                this.detailImgUrl = URL.createObjectURL(this.detailImg);
            },
            fnChangeDBFormat(date) {

                var year = date.getFullYear() + "";
                year = year.substr(2, 2);

                var month = date.getMonth();
                if (month < 10) {
                    month = "0" + month;
                } else {
                    month = month + "";
                }

                var day = date.getDate();
                if (day < 10) {
                    day = "0" + day;
                } else {
                    day = day + "";
                }

                var result = year + "/" + month + "/" + day;

                return result;
            },
            fnUploadProductImg(sellId, imageFile, imageCode) {
                const formData = new FormData();
                formData.append("productId", sellId);
                formData.append("productImg", imageFile);
                formData.append("imageCode", imageCode);

                $.ajax({
					url:"uploadProductImg.dox",
					dataType:"json",
					type : "POST",
					data : formData,
                    processData : false,
                    contentType : false,
					success : () => {
                        alert("게시되었습니다!");
                        this.fnInit();
					},
                    error : function(jqXHR, textStatus, errorThrown) {
                        console.error('업로드 실패!', textStatus, errorThrown);
                    }
				});
            },
            fnInit() {
                this.productId = "";
                this.description = "";
                this.targetAmount = "";
                this.endDate = new Date();
                this.discount = 0;
                this.detailImg = "";
                this.detailImgUrl = "";
            }
        },
        mounted() {
            this.fnGetProductList();
        },
    });
    app.mount("#app");
</script>