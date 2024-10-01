<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/registerProduct.css" />
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
                <h3>제품 등록</h3>
                <hr>
                <table>
                    <tr>
                        <th>제품명</th>
                        <td>
                            <input type="text" v-model="productName">
                        </td>
                    </tr>
                    <tr>
                        <th>썸네일</th>
                        <td class="imageUploaderLine">
                            <div class="imgBox">
                                <img class="img" :src="thumbnailUrl">
                            </div>
                            <label class="imgUploadBtn">
                                등록하기
                                <input type="file" @change="fnThumbnailChange" style="visibility: hidden;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            제품 이미지<br>
                            (최대 3장)
                        </th>
                        <td class="imageUploaderLine">
                            <div class="imgBox">
                                <img class="img" :src="productImgUrls[ 0 ]">
                            </div>
                            <div class="imgBox">
                                <img class="img" :src="productImgUrls[ 1 ]">
                            </div>
                            <div class="imgBox">
                                <img class="img" :src="productImgUrls[ 2 ]">
                            </div>
                            <label class="imgUploadBtn">
                                등록하기
                                <input type="file" @change="fnImgChange" style="visibility: hidden;" multiple>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th>타입</th>
                        <td>
                            <select v-model="type">
                                <option v-for="item in productCodeList" :value="item.code">{{item.codeName}}</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td><input type="text" v-model="price"></td>
                    </tr>
                    <tr>
                        <th>원산지</th>
                        <td><input type="text" v-model="madeBy"></td>
                    </tr>
                    <tr>
                        <th>도수</th>
                        <td><input type="text" v-model="alcohol"></td>
                    </tr>
                    <tr>
                        <th>탄산</th>
                        <td>
                            <select v-model="sparkling">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>단 맛</th>
                        <td>
                            <select v-model="sweet">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>신 맛</th>
                        <td>
                            <select v-model="sour">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>쓴 맛</th>
                        <td>
                            <select v-model="bitter">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>바디감</th>
                        <td>
                            <select v-model="body">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>용량</th>
                        <td><input type="text" v-model="capacity"></td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><input type="text" v-model="stock"></td>
                    </tr>
                    <tr>
                        <th>원재료</th>
                        <td><input type="text" v-model="material"></td>
                    </tr>
                </table>
                <hr>
                <div class="btnWrapper">
                    <div class="submitBtn" @click="fnSubmit">제품등록</div>
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
                userstatus : "${sessionStatus}",

                productCodeList : [],

                productId : "",
                productName : "",
                thumbnail : "",
                productImgs : [],
                type : "",
                price : "",
                madeBy : "",
                alcohol : "",
                sparkling : "",
                sweet : "",
                sour : "",
                bitter : "",
                body : "",
                stock : "",
                capacity : "",
                material : "",

                thumbnailUrl   : "../../image/photo_gray.png",
                productImgUrls : [
                    "../../image/photo_gray.png",
                    "../../image/photo_gray.png",
                    "../../image/photo_gray.png"
                ],
            };
        },
        methods: {
            fnThumbnailChange(event) {
                this.thumbnail = event.target.files[ 0 ];
                this.thumbnailUrl = URL.createObjectURL(this.thumbnail);
            },
            fnImgChange(event) {
                // 제품 이미지는 최대 3개
                for (var i = 0; i < 3; i++) {
                    if (event.target.files[ i ] == undefined) continue;

                    this.productImgs[ i ] = event.target.files[ i ];
                    this.productImgUrls[ i ] = URL.createObjectURL(this.productImgs[ i ]);
                }
            },
            fnSubmit() {
                if (this.fnAllCheck() ) {
                    alert("전부 채워주세요");
                    return;
                }

                $.ajax({
					url:"registerProduct.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        type        : this.type,
                        productName : this.productName,
                        price       : this.price,
                        userId      : this.userId,
                        madeBy      : this.madeBy,
                        alcohol     : this.alcohol,
                        sparkling   : this.sparkling,
                        sweet       : this.sweet,
                        sour        : this.sour,
                        bitter      : this.bitter,
                        body        : this.body,
                        stock       : this.stock,
                        capacity    : this.capacity,
                        material    : this.material
                    },
					success : (data) => {
						console.log(data);
                        this.productId = data.productId;

                        this.fnUploadProductImg(this.thumbnail, "T", false);
                        for (var i = 0; i < this.productImgs.length; i++) {
                            if (i == this.productImgs.length - 1) {
                                this.fnUploadProductImg(this.productImgs[ i ], "P", true);
                            }
                            this.fnUploadProductImg(this.productImgs[ i ], "P", false); 
                        }
					}
				});
            },
            fnUploadProductImg(imageFile, imageCode, isLast) {
                const formData = new FormData();
                formData.append("productId", this.productId);
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
                        if (isLast) alert("등록되었습니다!");
					},
                    error : function(jqXHR, textStatus, errorThrown) {
                        console.error('업로드 실패!', textStatus, errorThrown);
                    }
				});
            },
            fnAllCheck() {
                var isEmpty = false;
                if (this.productName == "") isEmpty = true;
                if (this.thumbnail   == "") isEmpty = true;
                if (this.type        == "") isEmpty = true;
                if (this.price       == "") isEmpty = true;
                if (this.madeBy      == "") isEmpty = true;
                if (this.alcohol     == "") isEmpty = true;
                if (this.sparkling   == "") isEmpty = true;
                if (this.sweet       == "") isEmpty = true;
                if (this.sour        == "") isEmpty = true;
                if (this.bitter      == "") isEmpty = true;
                if (this.body        == "") isEmpty = true;
                if (this.stock       == "") isEmpty = true;
                if (this.capacity    == "") isEmpty = true;
                if (this.material    == "") isEmpty = true;

                // 제품 이미지는 최소 1개 이상
                if (this.productImgs[ 0 ] == undefined) isEmpty = true;

                return isEmpty;
            },
            fnReset() {
                this.productName = "";
                this.thumbnail = "";
                this.productImgs = [];
                this.type = "";
                this.price = "";
                this.madeBy = "";
                this.alcohol = "";
                this.sparkling = "";
                this.sweet = "";
                this.sour = "";
                this.bitter = "";
                this.body = "";
                this.stock = "";
                this.capacity = "";
                this.material = "";

                this.thumbnailUrl = "../../image/defaultImg.png";
                this.productImgUrls = [
                    "../../image/defaultImg.png",
                    "../../image/defaultImg.png",
                    "../../image/defaultImg.png"
                ];
            },
            fnGetProductCode() {
                $.ajax({
					url:"getProductCodeList.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
                        this.productCodeList = data.list;
					}
				});
            }
        },
        mounted() {
            this.fnGetProductCode();
        },
    });
    app.mount("#app");
</script>