<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/modifyProduct.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
        <jsp:include page="../mainPage/header.jsp"></jsp:include>
        <div id="main">
            <jsp:include page="sellerSideBar.jsp"></jsp:include>
            <div id="container">
                <h3>제품 수정</h3>
                <hr>
                <table>
                    <tr>
                        <td>제품명</td>
                        <td>
                            <input type="text" v-model="productName">
                        </td>
                    </tr>
                    <tr>
                        <td>썸네일</td>
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
                        <td>
                            제품 이미지<br>
                            (최대 3장)
                        </td>
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
                        <td>타입</td>
                        <td>
                            <select v-model="type">
                                <option value="TJ">탁주</option>
                                <option value="CJ">청주</option>
                                <option value="SJ">증류주</option>
                                <option value="FJ">과실주</option>
                                <option value="TW">전통주 와인</option>
                                <option value="RW">레드 와인</option>
                                <option value="WW">화이트 와인</option>
                                <option value="G">선물세트</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" v-model="price"></td>
                    </tr>
                    <tr>
                        <td>원산지</td>
                        <td><input type="text" v-model="madeBy"></td>
                    </tr>
                    <tr>
                        <td>도수</td>
                        <td><input type="text" v-model="alcohol"></td>
                    </tr>
                    <tr>
                        <td>탄산</td>
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
                        <td>단 맛</td>
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
                        <td>신 맛</td>
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
                        <td>쓴 맛</td>
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
                        <td>바디감</td>
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
                        <td>용량</td>
                        <td><input type="text" v-model="capacity"></td>
                    </tr>
                    <tr>
                        <td>재고</td>
                        <td><input type="text" v-model="stock"></td>
                    </tr>
                    <tr>
                        <td>원재료</td>
                        <td><input type="text" v-model="material"></td>
                    </tr>
                </table>
                <div class="submitBtn" @click="fnSubmit">수정하기</div>
            </div>
        </div>
        <button @click="fnTest">test</button>
        <jsp:include page="../mainPage/footer.jsp"></jsp:include>
    </div>
</body>

</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                productId : "${productId}",
                userId : "${sessionId}",
                userStatus : "${sessionStatus}",

                productName : null,
                thumbnail : null,
                productImgs : [],
                type : null,
                price : null,
                madeBy : null,
                alcohol : null,
                sparkling : null,
                sweet : null,
                sour : null,
                bitter : null,
                body : null,
                stock : null,
                capacity : null,
                material : null,

                thumbnailUrl   : "../../image/defaultImg.png",
                productImgUrls : [
                    "../../image/defaultImg.png",
                    "../../image/defaultImg.png",
                    "../../image/defaultImg.png"
                ],
                beforeThumbnailUrl : "",
                beforeProductImgUrls : [],
            }
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
                // if (this.fnAllCheck() ) {
                //     alert("전부 채워주세요");
                //     return;
                // }

                $.ajax({
					url:"modifyProduct.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        productId   : this.productId,
                        productName : this.productName,
                        type        : this.type,
                        price       : this.price,
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
                        //this.fnDeleteBeforeImg();
                        //this.fnUploadProductImg();
					}
				});
            },
            fnDeleteBeforeImgs() {
                $.ajax({
					url:"deleteBeforeImgs.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        beforeThumbnailUrl   : this.beforeThumbnailUrl,
                        beforeProductImgUrls : this.beforeProductImgUrls
                    },
					success : (data) => {
						console.log(data);
					}
				});
            },
            fnUploadProductImg() {
                const formData = new FormData();
                formData.append("productId", this.productId);
                formData.append("thumbnail", this.thumbnail);

                for (var img of this.productImgs) {
                    formData.append("productImgs", img);
                }

                $.ajax({
					url:"uploadProductImg.dox",
					dataType:"json",
					type : "POST",
					data : formData,
                    processData : false,
                    contentType : false,
					success : () => {
						alert("등록되었습니다!");
                        this.fnReset();
					},
                    error : function(jqXHR, textStatus, errorThrown) {
                        console.error('업로드 실패!', textStatus, errorThrown);
                    }
				});
            },
            // fnAllCheck() {
            //     var isEmpty = false;
            //     if (this.productName == "") isEmpty = true;
            //     if (this.type        == "") isEmpty = true;
            //     if (this.price       == "") isEmpty = true;
            //     if (this.madeBy      == "") isEmpty = true;
            //     if (this.alcohol     == "") isEmpty = true;
            //     if (this.sparkling   == "") isEmpty = true;
            //     if (this.sweet       == "") isEmpty = true;
            //     if (this.sour        == "") isEmpty = true;
            //     if (this.bitter      == "") isEmpty = true;
            //     if (this.body        == "") isEmpty = true;
            //     if (this.stock       == "") isEmpty = true;
            //     if (this.capacity    == "") isEmpty = true;
            //     if (this.material    == "") isEmpty = true;

            //     // thumbnail하고 productImg 빼놨음
            //     // 나중에 추가

            //     return isEmpty;
            // },
            fnGetProductInfo() {
                $.ajax({
					url:"getProductInfo.dox",
					dataType:"json",
					type : "POST", 
					data : { productId : this.productId },
					success : (data) => {
						console.log(data);
                        this.fnSetInfo(data.product);
                        this.fnSetImages();
					}
				});
            },
            fnSetInfo(info) {
                this.productName = info.productName;
                this.type        = info.type;
                this.price       = info.price;
                this.madeBy      = info.madeBy;
                this.alcohol     = info.alcohol;
                this.sparkling   = info.sparkling;
                this.sweet       = info.sweet;
                this.sour        = info.sour;
                this.bitter      = info.bitter;
                this.body        = info.body;
                this.stock       = info.stock;
                this.capacity    = info.capacity;
                this.material    = info.material;
            },
            fnSetImages() {
                this.fnBackUpImages();

                $.ajax({
					url:"getProductImages.dox",
					dataType:"json",
					type : "POST", 
					data : { productId : this.productId },
					success : (data) => {
						console.log(data);
                        for (var item of data.result) {
                            if (item.fileStatus == "T") {
                                this.thumbnailUrl = item.filePath;
                            }
                            if (item.fileStatus == "P") {
                                this.productImgUrls.unshift(item.filePath);
                            }
                        }
					}
				});
            },
            fnBackUpImages() {
                this.beforeThumbnailUrl   = this.thumbnailUrl;
                this.beforeProductImgUrls = this.productImgUrls;
            },
            fnTest() {
                this.fnDeleteBeforeImgs();
            }
        },
        mounted() {
            this.fnGetProductInfo();
        },
    });
    app.mount("#app");
</script>