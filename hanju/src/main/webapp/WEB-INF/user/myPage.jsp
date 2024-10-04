<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/myPage.css" />
    <link
      href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
      rel="stylesheet"
    />
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
        <div id="container">
            <div id="contents">
                <div class="myTit">
                    <h2>마이페이지</h2>
                </div>
                <div class="myOrder">
                    <div class="myState">
                        <ul class="orderState">
                            <li>
                                <strong>포인트</strong>
                                <a href="" class="count">
                                    <span>{{point}}</span>
                                </a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="../user/orderInfo.do" class="count">
                                    <span>{{bill || 0}}</span>
                                </a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="../user/orderInfo.do" class="count">
                                    <span>{{ship  || 0}}</span>
                                </a>
                            </li>
                            <li class="arrive">
                                <strong>배송완료</strong>
                                <a href="../user/orderInfo.do" class="count">
                                    <span>{{complete  || 0}}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="myPage">
                    <ul>
                        <li>
                            <a href="../user/gudokCheck.do">
                                <img src="../../image/calendar_month.png">
                                <strong>구독관리</strong>
                                <p>고객님께서 신청하신 정기배송의 신청 정보 및 내역을 확인하실 수 있습니다.</p>
                            </a>
                        </li>
                        <li>
                            <a href="../user/review.do">
                                <img src="../../image/review.png">
                                <strong>리뷰</strong>
                                <p>리뷰 작성시 포인트 적립을 해드립니다.</p>
                            </a>
                        </li>
                        <li>
                            <a href="../user/modifyBefore.do">
                                <img src="../../image/profile.png">
                                <strong>회원정보</strong>
                                <p>회원이신 고객님의 개인정보를 관리하는 공간입니다.</p>
                            </a>
                        </li>
                        <li>
                            <a href="../user/orderInfo.do">
                                <img src="../../image/orderList.png">
                                <strong>주문내역 조회</strong>
                                <p>고객님께서 주문하신 상품의  주문내역을 확인하실 수 있습니다.</p>
                            </a>
                        </li>
                        <li>
                            <a href="../user/favorite.do">
                                <img src="../../image/heart_plus.png">
                                <strong>관심상품</strong>
                                <p>찜하신 상품의 목록을 보여드립니다.</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
          </div>
          <div class="myPage">
            <ul>
              <li>
                <img src="../../image/calendar_month.png" />
                <a href="../user/gudokCheck.do">
                  <strong>구독관리</strong>
                  <p>
                    고객님께서 신청하신 정기배송의 신청 정보 및 내역을 확인하실
                    수 있습니다.
                  </p>
                </a>
              </li>
              <li>
                <img src="../../image/review.png" />
                <a href="../user/review.do">
                  <strong>리뷰</strong>
                  <p>리뷰 작성시 포인트 적립을 해드립니다.</p>
                </a>
              </li>
              <li>
                <img src="../../image/profile.png" />
                <a href="../user/modifyBefore.do">
                  <strong>회원정보</strong>
                  <p>회원이신 고객님의 개인정보를 관리하는 공간입니다.</p>
                </a>
              </li>
              <li>
                <img src="../../image/orderList.png" />
                <a href="../user/orderInfo.do">
                  <strong>주문내역 조회</strong>
                  <p>
                    고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
                  </p>
                </a>
              </li>
              <li>
                <img src="../../image/heart_plus.png" />
                <a href="../user/favorite.do">
                  <strong>관심상품</strong>
                  <p>찜하신 상품의 목록을 보여드립니다.</p>
                </a>
              </li>
              <li>
                <img src="../../image/board.png" />
                <a href="">
                  <strong>게시물 관리</strong>
                  <p>고객님께서 작성하신 게시물을 관리하는 공간입니다.</p>
                </a>
              </li>
            </ul>
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
        userId: "${sessionId}",
        point: "",
        bill: "",
        ship: "",
        complete: "",
      };
    },
    methods: {
      fnInfo() {
        var self = this;

        var nparmap = {
          userId: self.userId,
        };

        $.ajax({
          url: "info.dox",
          dataType: "json",
          type: "POST",
          data: nparmap,
          success: function (data) {
            console.log(data);
            self.point = data.list.point;
            for (var item of data.order) {
              if (item.status == "B") {
                self.bill = item.cnt;
              } else if (item.status == "S") {
                self.ship = item.cnt;
              } else if (item.status == "C") {
                self.complete = item.cnt;
              }
            }
          },
        });
      },
    },
    mounted() {
      var self = this;
      if ("${userId}" == "") {
        alert("로그인 해주세요.");
        location.href = "/user/login.do";
        return;
      }
      self.userId = "${userId}";
      self.fnInfo();
    },
  });
  app.mount("#app");
</script>
