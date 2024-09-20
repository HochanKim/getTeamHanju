<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/sellerMain.css" />
    
    <link rel="stylesheet" href="../../upload/202481881811706.png" />
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
            <div id="sideBar">
                <table>
                    <tr>
                        <td>제품 등록</td>
                    </tr>
                    <tr>
                        <td>제품 제거</td>
                    </tr>
                    <tr>
                        <td>일반 판매 등록</td>
                    </tr>
                    <tr>
                        <td>펀딩 등록</td>
                    </tr>
                    <tr>
                        <td>공동 구매 등록</td>
                    </tr>
                </table>
            </div>
            <div id="container">
                <h3>제품 등록</h3>
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
                        <td>
                            <input type="file" @change="fnThumbnailChange">
                        </td>
                    </tr>
                    <tr>
                        <td>상세 정보 이미지</td>
                        <td>
                            <input type="file" @change="fnImg1Change">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <td>
                            <input type="file" @change="fnImg2Change">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="file" @change="fnImg3Change">
                        </td>
                    </tr>
                    <tr>
                        <td>타입</td>
                        <td>
                            <select v-model="type">
                                <option value="T">전통주</option>
                                <option value="W">와인</option>
                                <option value="TW">전통주 와인</option>
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
                        <td>색깔</td>
                        <td><input type="text" v-model="color"></td>
                    </tr>
                    <tr>
                        <td>원재료</td>
                        <td><input type="text" v-model="material"></td>
                    </tr>
                </table>
                <button @click="fnSubmit">제품등록</button>
                <button @click="fnTest">test</button>
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
                productName : "",
                thumbnail : "",
                productImg1 : "",
                productImg2 : "",
                productImg3 : "",
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
                color : "",
                material : ""
            };
        },
        methods: {
            fnThumbnailChange(event) {
                this.thumbnail = event.target.files[ 0 ];
            },
            fnImg1Change(event) {
                this.productImg1 = event.target.files[ 0 ];
            },
            fnImg2Change(event) {
                this.productImg2 = event.target.files[ 0 ];
            },
            fnImg3Change(event) {
                this.productImg3 = event.target.files[ 0 ];
            },
            fnSubmit() {
                $.ajax({
					url:"registerProduct.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        type        : this.type,
                        productName : this.productName,
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
                        color       : this.color,
                        material    : this.material
                    },
					success : (data) => {
						console.log(data);
                        this.fnUploadProductImg(data.productId);
					}
				});
            },
            fnUploadProductImg(productId) {

                const formData = new FormData();
                formData.append("productId", productId);
                formData.append("thumbnail"  , this.thumbnail  );
                formData.append("productImg1", this.productImg1);
                formData.append("productImg2", this.productImg2);
                formData.append("productImg3", this.productImg3);

                $.ajax({
					url:"uploadProductImg.dox",
					dataType:"json",
					type : "POST",
					data : formData,
                    processData : false,
                    contentType : false,
					success : () => {
						console.log("성공");
					},
                    error : function(jqXHR, textStatus, errorThrown) {
                        console.error('업로드 실패!', textStatus, errorThrown);
                    }
				});
            },
            fnTest() {
                this.fnUploadProductImg(55);
            }
        },
        mounted() {

        },
    });
    app.mount("#app");
</script>