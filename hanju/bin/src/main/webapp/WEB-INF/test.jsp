<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
	
</style>
<body>
	<div id="app">
        {{test}}
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                test : ""
            };
        },
        methods: {
            fnTest() {
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data.result);
						this.test = data.result;
					}
				});
			}
        },
        mounted() {
			this.fnTest();
        }
    });
    app.mount('#app');

</script>