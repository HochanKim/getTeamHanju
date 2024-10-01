<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/modifyNormalSell.css" />
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
                <h3>판매글 수정</h3>
                <hr>
                <table>
                    <tr>
                        <th>판매글</th>
                        <td>
                            <select v-model="sellIndex" @change="fnSetNormalSellInfo">
                                <option v-for="(item, index) in normalSellList" :value="index">
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
                                <img v-if="detailImgUrl == null" class="img" src="../../image/photo_gray_big.png"> 
                                <img v-else class="img" :src="detailImgUrl">
                            </div>
                            <label class="imgUploadBtn">
                                등록하기
                                <input type="file" @change="fnImgChange" style="visibility: hidden;">
                            </label>
                        </td>
                    </tr>
                </table>
                <hr>
                <div class="btnWrapper">
                    <div class="submitBtn" @click="fnModifyNormalSell">게시하기</div>
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

                sellIndex : null,
                normalSellList : [],

                productId : null,
                sellId : null,
                discount : 0,
                description : null,
                detailImgId : null,
                detailImgUrl : null,

                isImageChange : false,
                detailImg : null,
                beforeImgId : null,
                beforeImgUrl : null,
            }
        },
        methods: {
            fnGetNormalSellList() {
                $.ajax({
					url:"getNormalSellList.dox",
					dataType:"json",
					type : "POST", 
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
                        this.normalSellList = data.list;
					}
				});
            },
            fnSetNormalSellInfo() {
                this.sellId       = this.normalSellList[ this.sellIndex ].sellId;
                this.productId    = this.normalSellList[ this.sellIndex ].productId
                this.discount     = this.normalSellList[ this.sellIndex ].discount;
                this.description  = this.normalSellList[ this.sellIndex ].description;
                this.detailImgId  = this.normalSellList[ this.sellIndex ].imageId;
                this.detailImgUrl = this.normalSellList[ this.sellIndex ].filePath;
            },
            fnImgChange(event) {
                this.isImageChange = true;

                this.fnBackUpImg();
                
                this.detailImg = event.target.files[ 0 ];
                this.detailImgUrl = URL.createObjectURL(this.detailImg);
            },
            fnBackUpImg() {
                this.beforeImgId  = this.detailImgId;
                this.beforeImgUrl = this.detailImgUrl;
            },
            fnModifyNormalSell() {
                $.ajax({
					url:"modifyNormalSell.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        sellId : this.sellId,
                        discount : this.discount,
                        description : this.description
                    },
					success : (data) => {
						console.log(data);
                        this.fnUploadImg();
					}
				});
            },
            fnUploadImg() {
                if (this.isImageChange) {
                    this.fnDeleteBeforeImg();
                    // 원래 sellId여야하나 현재 데이터베이스가 productId로 되어있다.
                    // 나중에 수정해야함.
                    this.fnUploadImgToServer(this.productId, this.detailImg, "D");
                } else {
                    this.fnInit();
                }
            },
            fnDeleteBeforeImg() {
                $.ajax({
					url:"deleteBeforeImg.dox",
					dataType:"json",
					type : "POST", 
					data : {
                        imageId  : this.beforeImgId,
                        imageUrl : this.beforeImgUrl
                    },
					success : (data) => {
						console.log(data);
					}
				});
            },
            fnUploadImgToServer(sellId, imageFile, imageCode) {
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
                this.sellIndex = null;
                this.fnGetNormalSellList();

                this.sellId = null;
                this.discount = null;
                this.description = null;
                this.detailImgId = null;
                this.detailImgUrl = null;

                this.isImageChange = false;
                this.detailImg = null;
                this.beforeImgId = null;
                this.beforeImgUrl = null;
            }
        },
        mounted() {
            this.fnGetNormalSellList();
        },
    });
    app.mount("#app");
</script>