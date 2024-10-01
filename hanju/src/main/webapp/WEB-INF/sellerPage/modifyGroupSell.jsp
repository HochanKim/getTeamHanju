<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/sellerPage/modifyGroupSell.css" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
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
                <h3>공동 구매 수정</h3>
                <hr>
                <table id="inputTemplate">
                    <tr>
                        <th>공동 구매 글</th>
                        <td>
                            <select v-model="sellIndex" @change="fnSetInfo">
                                <option v-for="(item, index) in groupSellList" :value="index">{{item.productName}}</option>
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
                    <div class="submitBtn" @click="fnModifyGroupSell">수정하기</div>
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
                groupSellList : [],

                productId : null,
                groupSellId : null,
                description : null,
                targetAmount : null,
                endDate : null,
                discount : null,
                detailImgId : null,
                detailImgUrl : null,

                isImageChange : false,
                detailImg : null,
                beforeImgId : null,
                beforeImgUrl : null,
            }
        },
        components: {
			VueDatePicker 
		},
        methods: {
            fnGetGroupSellList() {
                $.ajax({
					url:"getGroupSellList.dox",
					dataType:"json",
					type : "POST",
					data : { userId : this.userId },
					success : (data) => {
						console.log(data);
                        this.groupSellList = data.list;
					}
				});
            },
            fnSetInfo() {
                this.groupSellId  = this.groupSellList[ this.sellIndex ].groupSellId;
                this.productId    = this.groupSellList[ this.sellIndex ].productId;
                this.description  = this.groupSellList[ this.sellIndex ].description;
                this.targetAmount = this.groupSellList[ this.sellIndex ].targetAmount;
                this.discount     = this.groupSellList[ this.sellIndex ].discount;
                this.detailImgUrl = this.groupSellList[ this.sellIndex ].filePath;

                this.endDate = new Date(this.groupSellList[ this.sellIndex ].endDate);
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
            fnModifyGroupSell() {
                $.ajax({
					url:"modifyGroupSell.dox",
					dataType:"json",
					type : "POST",
					data : {
                        groupSellId  : this.groupSellId,
                        description  : this.description,
                        targetAmount : this.targetAmount,
                        endDate      : this.fnChangeDBFormat(this.endDate),
                        discount     : this.discount
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
                        console.log("fnDeleteBeforeImg()");
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
                this.fnGetGroupSellList();

                this.productId = null;
                this.groupSellId = null;
                this.description = null;
                this.targetAmount = null;
                this.endDate = null;
                this.discount = null;
                this.detailImg = null;
                this.detailImgUrl = null;

                this.isImageChange = false;
                this.detailImg = null;
                this.beforeImgId = null;
                this.beforeImgUrl = null;
            },
            fnChangeDBFormat(date) {

                var year = date.getFullYear() + "";
                year = year.substr(2, 2);

                var month = date.getMonth() + 1; // 0 ~ 11이라 +1해줘야 함
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
            fnDateChange() {
                console.log("fnDateChange");
            }
        },
        mounted() {
            this.fnGetGroupSellList();
        },
    });
    app.mount("#app");
</script>