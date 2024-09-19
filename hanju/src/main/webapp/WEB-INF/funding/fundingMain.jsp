<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/mainCss.css" />
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
    <link rel="StyleSheet" href = "style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>    
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
 
  </head>
  <body>
    <div id="app">
        <div style="display: flex;">
            <div>
            <img class="img" src="../../image/01_barrack.png" class="funding-img">
            </div>
            <div class="funding-content">
                <h4>병영소주</h4>
                <p>설명</p>
                <div class="zt-skill-bar">
                    <div data-width="88">펀딩<span>88%</span>
                    </div>
                </div>
            </div>
        </div>
 
    </div>
  </body>
</html>
<script>
    (function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');

                $this.css({'width' : skills + '%'});

            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery));
  const app = Vue.createApp({
    data() {
      return {};
    },
    methods: {},
    mounted() {},
  });
  app.mount("#app");
</script>