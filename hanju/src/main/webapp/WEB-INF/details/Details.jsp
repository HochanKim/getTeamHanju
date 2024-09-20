<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/details.css" />
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
    <jsp:include page="../mainPage/header.jsp" flush="false" />
  </head>
  <body>
    <div id="app">
        <div class="thumb">
        <div>
            <img :src="img.productImage" class="thumb-img">
        </div>
        <div>
            <div class="font-size">{{info.productName}}</div>
            <div>판매가격 :</div>
            <div class="font-size">{{info.price}}원</div>
        </div>
    </div>
        <div class="box">
            <div class="row">
                <div class="title">주종</div> 
                <div class="content">주종 들어갈 곳~~~</div>
            </div>
            <div class="row"> 
                <div class="title">도수 </div>
                <div class="content">{{info.alcohol}}</div>
            </div>
            <div class="row">
                <div class="title">용량 </div>
                <div class="content">{{info.capacity}}ml</div>
            </div>
        </div>
        <div class="box">
            <div class="row">
                <div class="title">단맛</div> 
                <div class="content">{{info.sweet}}</div>
            </div>
            <div class="row">
                <div class="title">산미</div> 
                <div class="content">{{info.sour}}</div>
            </div>
            <div class="row">
                <div class="title">씁쓸</div> 
                <div class="content">{{info.bitter}}</div>
            </div>
            <div class="row">
                <div class="title">바디</div> 
                <div class="content">{{info.body}}</div>
            </div>
            <div class="row">
                <div class="title">탄산</div> 
                <div class="content">{{info.sparkling}}</div>
            </div>
        </div>
    <div>
        <img :src="img.detailImage" class="detail-img">
    </div>

    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        info : {},
        img : {}
      };
    },
    methods: {
		fnGetList(){
			var self = this;
			var nparam = {
                
				};
				$.ajax({
					url:"details.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);
                        self.info = data.info[0];
                        self.img = data.img;
                        console.log(self.img);
                        console.log(self.info);
					}
				});
			}

        },
    mounted() {
        this.fnGetList();
    },
  });
  app.mount("#app");
</script>