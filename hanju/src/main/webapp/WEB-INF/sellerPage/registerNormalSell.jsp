<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/registerNormalSell.css" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="sellerSideBar.jsp"></jsp:include>
        <div id="app">
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
                            상세 설명 이미지
                        </th>
                        <td class="imageUploaderLine">
                            <div class="imgBox">
                                <img v-if="productDetailImgUrl == ''" class="img" src="../../image/photo_gray_big.png"> 
                                <img v-else class="img" :src="productDetailImgUrl">
                            </div>
                            <label class="imgUploadBtn">
                                등록하기
                                <input type="file" @change="fnImgChange" style="visibility: hidden;" multiple>
                            </label>
                        </td>
                    </tr>
                </table>
                <hr>
                <div class="btnWrapper">
                    <div class="submitBtn" @click="fnRegisterSell">게시하기</div>
                </div>
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
                discount : 0,
                description : "",

                productDetailImg : "",
                productDetailImgUrl : "",
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
                    },
					success : (data) => {
						console.log(data);
                        this.fnUploadProductImg(data.sellId, this.productDetailImg, "D");
					}
				});
            },
            fnUploadProductImg(sellId, imageFile, imageCode) {
                const formData = new FormData();
                formData.append("productId", sellId);
                formData.append("imageCode", imageCode);
                formData.append("productImg", imageFile);

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
                this.discount = 0;
                this.description = "";
                this.productDetailImg = "";
                this.productDetailImgUrl = "";
            },
            fnImgChange(event) {
                this.productDetailImg = event.target.files[ 0 ];
                this.productDetailImgUrl = URL.createObjectURL(this.productDetailImg);
            },
        },
        mounted() {
            this.fnGetProductList();
        },
    });
    app.mount("#app");
</script>